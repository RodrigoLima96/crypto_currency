// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CryptoStore on _CryptoStoreBase, Store {
  late final _$cryptosListAtom =
      Atom(name: '_CryptoStoreBase.cryptosList', context: context);

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
      AsyncAction('_CryptoStoreBase.getCryptos', context: context);

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
