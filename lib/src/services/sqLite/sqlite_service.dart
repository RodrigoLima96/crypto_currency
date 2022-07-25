import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqLiteService {
  SqLiteService._();

  // Criar uma instância de DB
  static final SqLiteService instance = SqLiteService._();

  // Instância de SQLite
  static Database? _dataBase;

  get database async {
    if (_dataBase != null) return _dataBase;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'crypto.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_account);
    await db.execute(_crypto);
    await db.execute(_wallet);
    await db.execute(_transactions);
  }

  String get _account => '''
    CREATE TABLE account (
      balance REAL
    );
  ''';

  String get _crypto => '''
    CREATE TABLE crypto (
      id TEXT PRIMARY KEY,
      symbol TEXT,
      name TEXT,
      icon TEXT,
      price TEXT,
      timestamp INTEGER,
      changeHour TEXT,
      changeDay TEXT,
      changeWeek TEXT,
      changeMonth TEXT,
      changeYear TEXT,
      changeAllTime TEXT
    );
  ''';

  String get _wallet => '''
    CREATE TABLE wallet (
      symbol TEXT PRIMARY KEY,
      crypto TEXT,
      amount TEXT
    );
  ''';

  String get _transactions => '''
    CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date_operation INT,
      type_operation TEXT,
      crypto TEXT,
      symbol TEXT,
      value REAL,
      amount TEXT
    );
  ''';
}
