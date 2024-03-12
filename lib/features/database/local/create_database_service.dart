import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../core/errors/errors.dart';

class CreateDatabaseService {
  Future<Database> createDatabase() async {
    try {
      return await openDatabase(
        join(await getDatabasesPath(), 'crypto_currency.db'),
        version: 1,
        onCreate: _onCreate,
      );
    } on CacheException {
      throw CacheFailure();
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute(_crypto);
    await db.execute(_wallet);
  }

  String get _crypto => '''
    CREATE TABLE crypto (
      cryptoId TEXT,
      icon TEXT,
      name TEXT,
      symbol TEXT,
      timeStamp TEXT,
      price REAL,
      changeHour REAL,
      changeDay REAL,
      changeWeek REAL,
      changeMonth REAL,
      changeYear REAL,
      changeAllTime REAL
    );
  ''';

  String get _wallet => '''
    CREATE TABLE wallet (
      cryptoId TEXT,
      amount REAL
    );
  ''';
}
