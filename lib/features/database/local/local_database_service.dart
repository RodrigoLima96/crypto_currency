import 'package:sqflite/sqflite.dart';

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
}
