import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/services/sqLite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class AccountRepository {
  getBalance() async {
    Database db = await SqLiteService.instance.database;

    List account = await db.query('account', limit: 1);
    if (account.isNotEmpty) {
      double _balance = account.first['balance'];
      return _balance;
    }
    return 0.0;
  }

  getWallet() async {
    Database db = await SqLiteService.instance.database;
    List positions = await db.query('wallet');
    return positions;
  }

  getTransactions() async {
    Database db = await SqLiteService.instance.database;
    List transactions = await db
        .rawQuery('SELECT * FROM transactions ORDER BY date_operation DESC');

    return transactions;
  }

  setBalance(double value) async {
    Database db = await SqLiteService.instance.database;
    await db.update('account', {'balance': value});
  }

  buyCrypto(Crypto crypto, double value, double userBalance) async {
    Database db = await SqLiteService.instance.database;

    await db.transaction((txn) async {
      // Check if the crypto has already been purchased
      final cryptoPosition = await txn.query(
        'wallet',
        where: 'symbol = ?',
        whereArgs: [crypto.symbol],
      );

      // If you don't have the crypto
      if (cryptoPosition.isEmpty) {
        await txn.insert('wallet', {
          'symbol': crypto.symbol,
          'crypto': crypto.name,
          'amount': (value / crypto.price).toString()
        });
      }

      // Already have the crypto
      else {
        final newCrypto =
            double.parse(cryptoPosition.first['amount'].toString());
        await txn.update(
          'wallet',
          {'amount': ((value / crypto.price) + newCrypto).toString()},
          where: 'symbol = ?',
          whereArgs: [crypto.symbol],
        );
      }

      // Insert the purchase in the history
      await txn.insert('transactions', {
        'symbol': crypto.symbol,
        'crypto': crypto.name,
        'amount': (value / crypto.price).toString(),
        'value': value,
        'type_operation': 'buy',
        'date_operation': DateTime.now().millisecondsSinceEpoch
      });

      // Update balance
      await txn.update('account', {'balance': userBalance - value});
    });
  }

  sellCrypto(Crypto crypto, double value, double userBalance) async {
    Database db = await SqLiteService.instance.database;
    await db.transaction((txn) async {
      final walletCrypto = await txn.query(
        'wallet',
        where: 'symbol = ?',
        whereArgs: [crypto.symbol],
      );

      final oldValue = double.parse(walletCrypto.first['amount'].toString());

      await txn.update(
        'wallet',
        {'amount': (oldValue - (value / crypto.price)).toString()},
        where: 'symbol = ?',
        whereArgs: [crypto.symbol],
      );

      double newValue = oldValue - (value / crypto.price);

      if (newValue * crypto.price <= 0.01) {
        await txn
            .delete('wallet', where: 'symbol = ?', whereArgs: [crypto.symbol]);
      }

      await txn.insert('transactions', {
        'symbol': crypto.symbol,
        'crypto': crypto.name,
        'amount': (value / crypto.price).toString(),
        'value': value,
        'type_operation': 'sell',
        'date_operation': DateTime.now().millisecondsSinceEpoch
      });

      await txn.update('account', {'balance': userBalance + value});
    });
  }
}
