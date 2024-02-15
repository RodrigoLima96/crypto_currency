import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetCryptoUsecase {
  final ICryptoRepository repository;

  const GetCryptoUsecase({required this.repository});

  Future<Either<Failure, List<CryptoEntity>>> call() async {
    return await repository.getCryptos();
  }
}