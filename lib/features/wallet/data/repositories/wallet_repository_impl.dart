import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class WalletRepositoryImpl implements IWalletRepository {
  final IWalletDatasource datasource;

  const WalletRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<WalletEntity>>> getWallet() async {
    try {
      final result = await datasource.getWallet();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> tradeCrypto(
      {required TradeEntity tradeEntity}) async {
    try {
      final result = await datasource.tradeCrypto(
        tradeEntity: tradeEntity,
      );
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
