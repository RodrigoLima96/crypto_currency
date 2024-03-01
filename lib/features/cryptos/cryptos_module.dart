import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../home/pages/pages.dart';
import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';
import 'presenter/store/store.dart';

class CryptosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => GetCryptoUsecase(repository: i())),
    Bind.lazySingleton((i) => CryptoRepository(datasource: i())),
    Bind.lazySingleton((i) => CryptoDatasourceImpl(client: i())),
    Bind.lazySingleton((i) => CryptoStore(usecase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const HomePage()),
  ];
}