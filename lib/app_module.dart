import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'features/cryptos/data/datasources/datasources.dart';
import 'features/cryptos/data/repositories/repositories.dart';
import 'features/cryptos/domain/usecases/usecases.dart';
import 'features/cryptos/presenter/pages/pages.dart';
import 'features/cryptos/presenter/store/store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GetCryptoUsecase(repository: i())),
    Bind.lazySingleton((i) => CryptoRepository(datasource: i())),
    Bind.lazySingleton((i) => CryptoDatasourceImpl(client: i())),
    Bind.lazySingleton((i) => CryptoStore(usecase: i())),
    Bind.lazySingleton((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const CryptosPage()),
  ];
}