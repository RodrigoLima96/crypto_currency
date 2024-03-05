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

  late final _$loadCryptoInfoAsyncAction =
      AsyncAction('_CryptoPageStoreBase.loadCryptoInfo', context: context);

  @override
  Future<void> loadCryptoInfo({required String name}) {
    return _$loadCryptoInfoAsyncAction
        .run(() => super.loadCryptoInfo(name: name));
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
  String toString() {
    return '''
cryptoName: ${cryptoName},
period: ${period}
    ''';
  }
}
