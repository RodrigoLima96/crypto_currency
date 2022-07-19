import 'dart:async';
import 'package:crypto_currency/src/services/crypto_info_service/crypto_info_service.dart';
import 'package:crypto_currency/src/services/sqLite/sqlite_service.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class MoedasRepository extends ChangeNotifier {
  List<Crypto> _table = [];
  late Timer timeUpdate;
  final CryptoInfoService _cryptoInfoService;

  List<Crypto> get table => _table;

  MoedasRepository(this._cryptoInfoService) {
    SqLiteService.instance.createCryptoTable();
    _setupCryptoDataTable();
    _readCryptoTable();
    _refreshPrices();
  }

  getHistoricoMoeda(Crypto crypto) async {
    List<Map<String, dynamic>> precos = [];

    final Map<String, dynamic> priceList =
        await _cryptoInfoService.getCryptoHistory(crypto);

    precos.add(priceList['hour']);
    precos.add(priceList['day']);
    precos.add(priceList['week']);
    precos.add(priceList['month']);
    precos.add(priceList['year']);
    precos.add(priceList['all']);

    return precos;
  }

  _refreshPrices() async {
    timeUpdate =
        Timer.periodic(const Duration(minutes: 1), (_) => checkPrices());
  }

  checkPrices() async {
    final List<dynamic> cryptoList = await _cryptoInfoService.checkPrices();

    // ignore: avoid_function_literals_in_foreach_calls
    _table.forEach(
      (oldCrypto) {
        // ignore: avoid_function_literals_in_foreach_calls
        cryptoList.forEach(
          (newCrypto) {
            if (oldCrypto.baseId == newCrypto['id']) {
              final crypto = newCrypto;
              final price = crypto['latest_price'];
              final timestamp =
                  DateTime.parse(newCrypto['latest_price']['timestamp']);

              SqLiteService.instance
                  .checkPrecos(cryptoList, timestamp, price, oldCrypto.baseId);
            }
          },
        );
      },
    );

    await _readCryptoTable();
    notifyListeners();
  }

  _readCryptoTable() async {
    _table = await SqLiteService.instance.readCryptoTable();
    notifyListeners();
  }

  _moedasTableIsEmpty() async {
    Database db = await SqLiteService.instance.database;
    List resultados = await db.query('crypto');
    notifyListeners();
    return resultados.isEmpty;
  }

  _setupCryptoDataTable() async {
    if (await _moedasTableIsEmpty()) {
      final List<dynamic> cryptoList = await _cryptoInfoService.getCryptoList();

      SqLiteService.instance.setupCryptoDataTable(cryptoList);
      notifyListeners();
    }
  }
}
