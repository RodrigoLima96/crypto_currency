
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../repositories/crypto_repository.dart';

class GetCryptoPricesUsecase {
  final ICryptoRepository repository;

  const GetCryptoPricesUsecase({required this.repository});

  Future<Either<Failure, List<Map<String, dynamic>>>> call({required String cryptoId}) async {
    return await repository.getCryptoPrices(cryptoId: cryptoId);
  }
}