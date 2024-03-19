import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/crypto_entity.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class CryptoRepositoryImpl implements ICryptoRepository {
  final ICryptoDatasource datasource;

  const CryptoRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<CryptoEntity>>> getCryptoList() async {
    try {
      final result = await datasource.getCryptos();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getCryptoPrices({required String cryptoId}) async {
    try {
      final result = await datasource.getCryptoPrices(cryptoId: cryptoId);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}