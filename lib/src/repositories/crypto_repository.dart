import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/services/crypto_info_service/crypto_info_service.dart';
import 'package:crypto_currency/src/services/sqLite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class CryptoRepository {
  List<Crypto> _cryptos = [];
  List<Crypto> get cryptos => _cryptos;

  final CryptoInfoService _cryptoInfoService;

  CryptoRepository(
    this._cryptoInfoService,
  ) {
    insertCryptos();
  }

  checkTableEmpty() async {
    Database db = await SqLiteService.instance.database;
    List result = await db.query('crypto');
    return result.isEmpty;
  }

  insertCryptos() async {
    Database db = await SqLiteService.instance.database;

    if (await checkTableEmpty()) {
      final List<dynamic> cryptos = await _cryptoInfoService.getCryptoList();

      Batch batch = db.batch();

      for (var crypto in cryptos) {
        final price = crypto['latest_price'];
        final timestamp = DateTime.parse(price['timestamp']);

        batch.insert('crypto', {
          'id': crypto['id'],
          'symbol': crypto['symbol'],
          'name': crypto['name'],
          'icon': crypto['image_url'],
          'price': crypto['latest'],
          'timestamp': timestamp.millisecondsSinceEpoch,
          'changeHour': price['percent_change']['hour'].toString(),
          'changeDay': price['percent_change']['day'].toString(),
          'changeWeek': price['percent_change']['week'].toString(),
          'changeMonth': price['percent_change']['month'].toString(),
          'changeYear': price['percent_change']['year'].toString(),
          'changeAllTime': price['percent_change']['all'].toString()
        });
      }
      await batch.commit(noResult: true);
    }
  }

  readCryptosTable() async {
    Database db = await SqLiteService.instance.database;
    List resultados = await db.query('crypto');

    _cryptos = resultados.map((row) {
      return Crypto(
        id: row['id'],
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

    return _cryptos;
  }

  refreshPrices(List<Crypto> cryptos) async {
    final List<dynamic> newPrices = await _cryptoInfoService.getCryptoList();

    Database db = await SqLiteService.instance.database;
    Batch batch = db.batch();

    for (var old in cryptos) {
      for (var newCrypto in newPrices) {
        if (old.id == newCrypto['id']) {
          final crypto = newCrypto;
          final price = crypto['latest_price'];
          final timestamp =
              DateTime.parse(newCrypto['latest_price']['timestamp']);

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
            where: 'id = ?',
            whereArgs: [old.id],
          );
        }
      }
    }
    await batch.commit(noResult: true);
  }
}
