import 'package:crypto_currency/src/services/crypto_info_service/crypto_info_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

enum Period { hour, day, week, month, year, all }

class BuyCryptoPageController extends ChangeNotifier {
  final CryptoInfoService _cryptoInfoService;

  Period period = Period.hour;
  double amount = 0;
  List<Color> colors = [const Color(0xFF3F51B5)];
  List allData = [];
  ValueNotifier<bool> loaded = ValueNotifier(false);
  List<FlSpot> chartData = [];
  List<Map<String, dynamic>> historic = [];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;

  BuyCryptoPageController(this._cryptoInfoService);

  getHistoricPrices(String cryptoId) async {
    List<Map<String, dynamic>> prices =
        await _cryptoInfoService.getCryptoPrices(cryptoId);

    return prices;
  }

  setData(String cryptoId) async {
    loaded.value = false;
    chartData = [];

    if (historic.isEmpty) {
      historic = await getHistoricPrices(cryptoId);
    }

    allData = historic[period.index]['prices'];
    allData = allData.reversed.map((item) {
      double preco = double.parse(item[0]);
      int time = int.parse(item[1].toString() + '000');
      return [preco, DateTime.fromMillisecondsSinceEpoch(time)];
    }).toList();

    maxX = allData.length.toDouble();
    maxY = 0;
    minY = double.infinity;

    for (var item in allData) {
      maxY = item[0] > maxY ? item[0] : maxY;
      minY = item[0] < minY ? item[0] : minY;
    }

    for (var i = 0; i < allData.length; i++) {
      chartData.add(FlSpot(
        i.toDouble(),
        allData[i][0],
      ));
    }

    loaded.value = true;
  }

  getDate(int index) {
    DateTime date = allData[index][1];
    if (period != Period.year && period != Period.all) {
      return DateFormat('dd/MM - hh:mm').format(date);
    } else {
      return DateFormat('dd/MM/y').format(date);
    }
  }

  changePeriod(Period p) {
    period = p;
    notifyListeners();
  }

  changeAmount(String value, double price) {
    amount = (value.isEmpty) ? 0 : double.parse(value) / price;
    notifyListeners();
  }
}
