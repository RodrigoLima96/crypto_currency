import 'package:flutter_modular/flutter_modular.dart';

import '../../core/usecases/usecases.dart';
import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    // Usecases
    Bind.lazySingleton((i) => GetUserBalanceUsecase(repository: i()), export: true),

    // Repositories
    Bind.lazySingleton((i) => AccountRepositoryImpl(datasource: i()), export: true),

    // Data sources
    Bind.lazySingleton((i) => AccountDatasourceImpl(localDatabase: i()), export: true),

    // Store
    // Bind.lazySingleton((i) => AccountStore(usecase: i()), export: true),
  ];
}
