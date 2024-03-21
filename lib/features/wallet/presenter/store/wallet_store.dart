// ignore_for_file: library_private_types_in_public_api

import 'package:crypto_currency/core/usecases/get_user_balance.dart';
import 'package:crypto_currency/features/wallet/domain/entities/entities.dart';
import 'package:crypto_currency/features/wallet/domain/usecases/usecases.dart';
import 'package:mobx/mobx.dart';

part 'wallet_store.g.dart';

class WalletStore = _WalletStoreBase with _$WalletStore;

abstract class _WalletStoreBase with Store {
  final GetWalletUsecase getWalletUsecase;
  final GetUserBalanceUsecase getUserBalanceUsecase;

  List<WalletEntity> wallet = [];

  @observable
  double userBalance = 0;

  _WalletStoreBase(
      {required this.getWalletUsecase, required this.getUserBalanceUsecase});

  @action
  Future<void> getWallet() async {
    try {
      final result = await getWalletUsecase();
      await tradeCrypto();
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

  @action
  Future<void> tradeCrypto() async {
    final result = await getUserBalanceUsecase();
    userBalance = result.getOrElse(() => 0);
  }
}