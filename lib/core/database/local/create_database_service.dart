import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../errors/errors.dart';

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

  void _onCreate(db, version) async {
    await db.execute(_crypto);
    await db.execute(_wallet);
    await db.execute(_account);

    await db.execute(_initialWalletData);
    await db.execute(_initialWalletData2);
    await db.execute(_initialAccountData);
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

  String get _account => '''
    CREATE TABLE account (
      name TEXT,
      image BLOB,
      balance REAL
    );
  ''';

  String get _initialWalletData => '''
  INSERT INTO wallet (
    cryptoId,
    amount
  )

  VALUES (
    'BTC',
    123
  );
''';

  String get _initialWalletData2 => '''
  INSERT INTO wallet (
    cryptoId,
    amount
  )

  VALUES (
    'ETH',
    1232
  );
''';

  String get _initialAccountData => '''
  INSERT INTO account (
    name,
    image,
    balance
  )

  VALUES (
    'Rodrigo',
    null,
    10000
  );
''';
}
