// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CryptoPageStore on _CryptoPageStoreBase, Store {
  late final _$cryptoNameAtom =
      Atom(name: '_CryptoPageStoreBase.cryptoName', context: context);

  @override
  String get cryptoName {
    _$cryptoNameAtom.reportRead();
    return super.cryptoName;
  }

  @override
  set cryptoName(String value) {
    _$cryptoNameAtom.reportWrite(value, super.cryptoName, () {
      super.cryptoName = value;
    });
  }

  late final _$cryptoAmountAtom =
      Atom(name: '_CryptoPageStoreBase.cryptoAmount', context: context);

  @override
  double get cryptoAmount {
    _$cryptoAmountAtom.reportRead();
    return super.cryptoAmount;
  }

  @override
  set cryptoAmount(double value) {
    _$cryptoAmountAtom.reportWrite(value, super.cryptoAmount, () {
      super.cryptoAmount = value;
    });
  }

  late final _$periodAtom =
      Atom(name: '_CryptoPageStoreBase.period', context: context);

  @override
  Period get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(Period value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  late final _$loadedAtom =
      Atom(name: '_CryptoPageStoreBase.loaded', context: context);

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  late final _$maxXAtom =
      Atom(name: '_CryptoPageStoreBase.maxX', context: context);

  @override
  double get maxX {
    _$maxXAtom.reportRead();
    return super.maxX;
  }

  @override
  set maxX(double value) {
    _$maxXAtom.reportWrite(value, super.maxX, () {
      super.maxX = value;
    });
  }

  late final _$maxYAtom =
      Atom(name: '_CryptoPageStoreBase.maxY', context: context);

  @override
  double get maxY {
    _$maxYAtom.reportRead();
    return super.maxY;
  }

  @override
  set maxY(double value) {
    _$maxYAtom.reportWrite(value, super.maxY, () {
      super.maxY = value;
    });
  }

  late final _$minYAtom =
      Atom(name: '_CryptoPageStoreBase.minY', context: context);

  @override
  double get minY {
    _$minYAtom.reportRead();
    return super.minY;
  }

  @override
  set minY(double value) {
    _$minYAtom.reportWrite(value, super.minY, () {
      super.minY = value;
    });
  }

  late final _$chartDataAtom =
      Atom(name: '_CryptoPageStoreBase.chartData', context: context);

  @override
  List<FlSpot> get chartData {
    _$chartDataAtom.reportRead();
    return super.chartData;
  }

  @override
  set chartData(List<FlSpot> value) {
    _$chartDataAtom.reportWrite(value, super.chartData, () {
      super.chartData = value;
    });
  }

  late final _$historicAtom =
      Atom(name: '_CryptoPageStoreBase.historic', context: context);

  @override
  List<Map<String, dynamic>> get historic {
    _$historicAtom.reportRead();
    return super.historic;
  }

  @override
  set historic(List<Map<String, dynamic>> value) {
    _$historicAtom.reportWrite(value, super.historic, () {
      super.historic = value;
    });
  }

  late final _$loadCryptoInfoAsyncAction =
      AsyncAction('_CryptoPageStoreBase.loadCryptoInfo', context: context);

  @override
  Future<void> loadCryptoInfo({required String name}) {
    return _$loadCryptoInfoAsyncAction
        .run(() => super.loadCryptoInfo(name: name));
  }

  late final _$getCryptoPricesAsyncAction =
      AsyncAction('_CryptoPageStoreBase.getCryptoPrices', context: context);

  @override
  Future<void> getCryptoPrices(
      {required String cryptoId, required bool firstLoad}) {
    return _$getCryptoPricesAsyncAction.run(
        () => super.getCryptoPrices(cryptoId: cryptoId, firstLoad: firstLoad));
  }

  late final _$_CryptoPageStoreBaseActionController =
      ActionController(name: '_CryptoPageStoreBase', context: context);

  @override
  void changePeriod(Period p) {
    final _$actionInfo = _$_CryptoPageStoreBaseActionController.startAction(
        name: '_CryptoPageStoreBase.changePeriod');
    try {
      return super.changePeriod(p);
    } finally {
      _$_CryptoPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDate(int index) {
    final _$actionInfo = _$_CryptoPageStoreBaseActionController.startAction(
        name: '_CryptoPageStoreBase.getDate');
    try {
      return super.getDate(index);
    } finally {
      _$_CryptoPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAmount({required String value, required double price}) {
    final _$actionInfo = _$_CryptoPageStoreBaseActionController.startAction(
        name: '_CryptoPageStoreBase.changeAmount');
    try {
      return super.changeAmount(value: value, price: price);
    } finally {
      _$_CryptoPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cryptoName: ${cryptoName},
cryptoAmount: ${cryptoAmount},
period: ${period},
loaded: ${loaded},
maxX: ${maxX},
maxY: ${maxY},
minY: ${minY},
chartData: ${chartData},
historic: ${historic}
    ''';
  }
}
