import 'package:crypto_currency/src/models/crypto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqLiteService {
  SqLiteService._();

  static final SqLiteService instance = SqLiteService._();

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
    await db.execute(_wallet);
    await db.execute(_transactions);
    await db.insert('account', {'amount': 0});
  }

  String get _account => '''
    CREATE TABLE account (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      amount REAL
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

  createCryptoTable() async {
    const String table = '''
    CREATE TABLE IF NOT EXISTS crypto (
      baseId TEXT PRIMARY KEY,
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

    await _dataBase!.execute(table);
  }

  setupCryptoDataTable(cryptoList) async {
    Batch batch = _dataBase!.batch();

    // ignore: avoid_function_literals_in_foreach_calls
    cryptoList.forEach((crypto) {
      final prices = crypto['latest_price'];
      final timestamp = DateTime.parse(prices['timestamp']);

      batch.insert('crypto', {
        'baseId': crypto['id'],
        'symbol': crypto['symbol'],
        'name': crypto['name'],
        'icon': crypto['image_url'],
        'price': crypto['latest'],
        'timestamp': timestamp.millisecondsSinceEpoch,
        'changeHour': prices['percent_change']['hour'].toString(),
        'changeDay': prices['percent_change']['day'].toString(),
        'changeWeek': prices['percent_change']['week'].toString(),
        'changeMonth': prices['percent_change']['month'].toString(),
        'changeYear': prices['percent_change']['year'].toString(),
        'changeAllTime': prices['percent_change']['all'].toString()
      });
    });

    await batch.commit(noResult: true);
  }

  readCryptoTable() async {
    List result = await _dataBase!.query('crypto');

    List<Crypto> cryptoList = result.map((row) {
      return Crypto(
        baseId: row['baseId'],
        icon: row['icon'],
        name: row['name'],
        symbol: row['symbol'],
        price: double.parse(row['price']),
        timeStamp: DateTime.fromMillisecondsSinceEpoch(row['timestamp']),
        changeHour: double.parse(row['changeHour']),
        changeDay: double.parse(row['changeDay']),
        changeWeek: double.parse(row['changeWeek']),
        changeMonth: double.parse(row['changeMonth']),
        changeYear: double.parse(row['changeYear']),
        changeAllTime: double.parse(row['changeAllTime']),
      );
    }).toList();

    return cryptoList;
  }

  checkPrecos(crypto, timestamp, price, args) async {
    Batch batch = _dataBase!.batch();

    batch.update(
      'crypto',
      {
        'price': crypto['latest'],
        'timestamp': timestamp.millisecondsSinceEpoch,
        'changeHour': price['percent_change']['hour'].toString(),
        'changeDay': price['percent_change']['day'].toString(),
        'changeWeek': price['percent_change']['week'].toString(),
        'changeMonth': price['percent_change']['month'].toString(),
        'changeYear': price['percent_change']['year'].toString(),
        'changeAllTime': price['percent_change']['all'].toString()
      },
      where: 'baseId = ?',
      whereArgs: [args],
    );

    await batch.commit(noResult: true);
  }
}
