// ignore_for_file: library_private_types_in_public_api

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/usecases/usecases.dart';

part 'crypto_page_store.g.dart';

class CryptoPageStore = _CryptoPageStoreBase with _$CryptoPageStore;

abstract class _CryptoPageStoreBase with Store {
  final GetCryptoPricesUsecase usecase;

  @observable
  String cryptoName = '';
  String currentCryptoId = '';

  @observable
  Period period = Period.hour;

  @observable
  bool loaded = false;

  @observable
  double maxX = 0;
  @observable
  double maxY = 0;
  @observable
  double minY = 0;

  @observable
  List<FlSpot> chartData = [];

  @observable
  List<Map<String, dynamic>> historic = [];

  List allData = [];

  _CryptoPageStoreBase({required this.usecase});

  @action
  Future<void> loadCryptoInfo({required String name}) async {
    cryptoName = name;
  }

  @action
  void changePeriod(Period p) {
    period = p;
  }

  @action
  getDate(int index) {
    DateTime date = allData[index][1];
    if (period != Period.year && period != Period.all) {
      return DateFormat('dd/MM - hh:mm').format(date);
    } else {
      return DateFormat('dd/MM/y').format(date);
    }
  }

  @action
  Future<void> getCryptoPrices({required String cryptoId}) async {
    loaded = false;
    chartData = [];
    currentCryptoId = cryptoId;

    try {
      final result = await usecase(cryptoId: cryptoId);
      result.fold(
        (failure) {
          throw Error();
        },
        (historicData) {
          historic = historicData;
        },
      );
    } catch (e) {
      throw Error();
    }

    allData = historic[period.index]['prices'];
    allData = allData.reversed.map((item) {
      double preco = double.parse(item[0]);
      int time = int.parse('${item[1]}000');
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
    loaded = true;
  }
}
