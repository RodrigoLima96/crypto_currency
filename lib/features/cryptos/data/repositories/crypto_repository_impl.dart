import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/crypto_entity.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class CryptoRepository implements ICryptoRepository {
  final ICryptoDatasource datasource;

  const CryptoRepository({required this.datasource});

  @override
  Future<Either<Failure, List<CryptoEntity>>> getCryptos() async {
    try {
      final result = await datasource.getCryptos();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}