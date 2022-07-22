import 'package:crypto_currency/src/services/crypto_info_service/crypto_info_service.dart';
import 'package:flutter/cupertino.dart';

enum Period { hour, day, week, month, year, all }

class BuyCryptoController extends ChangeNotifier {
  final CryptoInfoService _cryptoInfoService;
  Period period = Period.hour;
  double amount = 10;

  BuyCryptoController(this._cryptoInfoService);

  getHistoricPrices(String cryptoId) async {
    List<Map<String, dynamic>> prices =
        await _cryptoInfoService.getCryptoPrices(cryptoId);

    return prices;
  }
}
