import 'package:dartz/dartz.dart';

import '../../features/account/domain/repositories/repositories.dart';
import '../errors/errors.dart';

class GetUserBalanceUsecase {
  final IAccountRepository repository;

  const GetUserBalanceUsecase({required this.repository});

  Future<Either<Failure, double>> call() async {
    return await repository.getUserBalance();
  }
}
