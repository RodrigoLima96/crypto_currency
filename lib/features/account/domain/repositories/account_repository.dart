import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class IAccountRepository {
  Future<Either<Failure, double>> getUserBalance();
}