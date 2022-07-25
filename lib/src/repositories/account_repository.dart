import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/services/sqLite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class AccountRepository {
  getBalance() async {
    Database db = await SqLiteService.instance.database;

    List account = await db.query('account', limit: 1);
    double _balance = account.first['balance'];
    return _balance;
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
    db.update('account', {'balance': value});
  }

  buyCrypto(Crypto crypto, double value, double userBalance) async {
    Database db = await SqLiteService.instance.database;

    await db.transaction((txn) async {
      // Verifica se a moeda já foi comprada
      final cryptoPosition = await txn.query(
        'wallet',
        where: 'symbol = ?',
        whereArgs: [crypto.symbol],
      );

      // Se não tem a moeda em carteira
      if (cryptoPosition.isEmpty) {
        await txn.insert('wallet', {
          'symbol': crypto.symbol,
          'crypto': crypto.name,
          'amount': (value / crypto.price).toString()
        });
      }

      // Já tem a moeda em carteira
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

      // Inserir a compra no histórico
      await txn.insert('transactions', {
        'symbol': crypto.symbol,
        'crypto': crypto.name,
        'amount': (value / crypto.price).toString(),
        'value': value,
        'type_operation': 'buy',
        'date_operation': DateTime.now().millisecondsSinceEpoch
      });

      //Atualizar o saldo
      await txn.update('account', {'balance': userBalance - value});
    });
  }
}
