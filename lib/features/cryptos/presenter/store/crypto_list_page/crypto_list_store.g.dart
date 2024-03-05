// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CryptoListStore on _CryptoListStoreBase, Store {
  late final _$cryptosListAtom =
      Atom(name: '_CryptoListStoreBase.cryptosList', context: context);

  @override
  List<CryptoEntity> get cryptosList {
    _$cryptosListAtom.reportRead();
    return super.cryptosList;
  }

  @override
  set cryptosList(List<CryptoEntity> value) {
    _$cryptosListAtom.reportWrite(value, super.cryptosList, () {
      super.cryptosList = value;
    });
  }

  late final _$getCryptosAsyncAction =
      AsyncAction('_CryptoListStoreBase.getCryptos', context: context);

  @override
  Future<void> getCryptos() {
    return _$getCryptosAsyncAction.run(() => super.getCryptos());
  }

  @override
  String toString() {
    return '''
cryptosList: ${cryptosList}
    ''';
  }
}
