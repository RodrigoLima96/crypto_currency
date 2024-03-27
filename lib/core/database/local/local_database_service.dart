import 'package:sqflite/sqflite.dart';

import '../../../features/wallet/domain/entities/entities.dart';
import 'local.dart';

class LocalDatabaseService {
  final InitDatabaseService localDatabaseService;
  late Database _localDatabase;

  LocalDatabaseService({required this.localDatabaseService}) {
    initDatabase();
  }

  initDatabase() async {
    _localDatabase = await localDatabaseService.database;
  }

  getWallet() async {
    final result = await _localDatabase.query('wallet');
    return result;
  }

  getAccountData() async {
    final result = await _localDatabase.query('account');
    return result;
  }

  tradeCrypto(
      {required TradeEntity tradeEntity,
      required bool cryptoExists,
      required double newUserBalance}) async {
    if (cryptoExists) {
      await _localDatabase.update(
        'wallet',
        {'cryptoId': tradeEntity.cryptoId, 'amount': tradeEntity.cryptoAmount},
        where: 'cryptoId = ?',
        whereArgs: [tradeEntity.cryptoId],
      );
    } else {
      await _localDatabase.insert('wallet', {
        'cryptoId': tradeEntity.cryptoId,
        'amount': tradeEntity.cryptoAmount
      });
    }
    await _localDatabase.update('account', {
      'balance': newUserBalance,
    });
  }
}
