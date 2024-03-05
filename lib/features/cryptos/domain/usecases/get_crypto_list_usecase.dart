import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetCryptoListUsecase {
  final ICryptoRepository repository;

  const GetCryptoListUsecase({required this.repository});

  Future<Either<Failure, List<CryptoEntity>>> call() async {
    return await repository.getCryptoList();
  }
}