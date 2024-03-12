import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract class IWalletRepository {
  Future<Either<Failure, List<WalletEntity>>> getWallet();

  Future<Either<Failure, void>> tradeCrypto({required TradeEntity tradeEntity});
}