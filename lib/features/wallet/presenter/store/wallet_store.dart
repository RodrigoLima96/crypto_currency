// ignore_for_file: library_private_types_in_public_api

import 'package:crypto_currency/features/wallet/domain/entities/entities.dart';
import 'package:crypto_currency/features/wallet/domain/usecases/usecases.dart';
import 'package:mobx/mobx.dart';

part 'wallet_store.g.dart';

class WalletStore = _WalletStoreBase with _$WalletStore;

abstract class _WalletStoreBase with Store {
  final GetWalletUsecase usecase;
  List<WalletEntity> wallet = [];

  _WalletStoreBase({required this.usecase});

  @action
  Future<void> getWallet() async {
    try {
      final result = await usecase();
      result.fold(
        (failure) {
          throw Error();
        },
        (list) {
          wallet = List.from(list);
        },
      );
    } catch (e) {
      throw Error();
    }
  }
}