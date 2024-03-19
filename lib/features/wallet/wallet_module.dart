import 'package:flutter_modular/flutter_modular.dart';

import '../../core/modules/modules.dart';
import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';
import 'presenter/store/store.dart';

class WalletModule extends Module {

  @override
  List<Module> get imports =>  [CoreModule()];

  @override
  final List<Bind> binds = [
    // Usecases
    Bind.lazySingleton((i) => GetWalletUsecase(repository: i()), export: true),

    // Repositories
    Bind.lazySingleton((i) => WalletRepositoryImpl(datasource: i()), export: true),

    // Data sources
    Bind.lazySingleton((i) => WalletDatasourceImpl(localDatabase: i()), export: true),

    // Store
    Bind.lazySingleton((i) => WalletStore(usecase: i()), export: true),
  ];
}
