// ignore_for_file: library_private_types_in_public_api

import 'package:crypto_currency/features/cryptos/domain/entities/entities.dart';
import 'package:crypto_currency/features/cryptos/domain/usecases/usecases.dart';
import 'package:mobx/mobx.dart';

part 'crypto_store.g.dart';

class CryptoStore = _CryptoStoreBase with _$CryptoStore;

abstract class _CryptoStoreBase with Store {
  @observable
  List<CryptoEntity> cryptosList = [];
  final GetCryptoUsecase usecase;

  _CryptoStoreBase({required this.usecase});

  @action
  Future<void> getCryptos() async {
    try {
      final result = await usecase();
      result.fold(
        (failure) {
          throw Error();
        },
        (list) {
          cryptosList = List.from(list);
        },
      );
    } catch (e) {
      throw Error();
    }
  }
}
