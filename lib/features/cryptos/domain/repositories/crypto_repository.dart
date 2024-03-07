import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract class ICryptoRepository {
  Future<Either<Failure, List<CryptoEntity>>> getCryptoList();

  Future<Either<Failure, List<Map<String, dynamic>>>> getCryptoPrices({required String cryptoId});
}