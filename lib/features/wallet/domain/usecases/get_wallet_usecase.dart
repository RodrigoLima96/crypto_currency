import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repositories.dart';

class GetWalletUsecase {
  final IWalletRepository repository;

  const GetWalletUsecase({required this.repository});

  Future<Either<Failure, List<WalletEntity>>> call() async {
    return await repository.getWallet();
  }
}