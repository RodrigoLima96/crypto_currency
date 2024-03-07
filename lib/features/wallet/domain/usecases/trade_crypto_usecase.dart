import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class TradeCryptoUsecase {
  final IWalletRepository repository;

  const TradeCryptoUsecase({required this.repository});

  Future<Either<Failure, void>> call({
    required WalletEntity walletEntity,
    required bool buyTransaction,
  }) async {
    return await repository.tradeCrypto(
      walletEntity: walletEntity,
      buyTransaction: buyTransaction,
    );
  }
}
