// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/utils/utils.dart';

part 'chart_store.g.dart';

class ChartStore = _ChartStoreBase with _$ChartStore;

abstract class _ChartStoreBase with Store {
  @observable
  String cryptoName = 'AAAAAAAAAAAAAAAAAAAAAA';

  @observable
  Period period = Period.hour;
  List<Color> colors = [const Color(0xFF3F51B5)];


  @action
  Future<void> loadCryptoInfo({required String name}) async {
    cryptoName = name;
  }

  @action
  void changePeriod(Period p) {
    period = p;
  }
}
