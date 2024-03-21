import '../datasources/datasources.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/repositories.dart';

class AccountRepositoryImpl implements IAccountRepository {
  final IAccountDatasource datasource;

  AccountRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, double>> getUserBalance() async {
    final result = await datasource.getUserBalance();
    return Right(result);
  }
}