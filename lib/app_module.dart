import 'package:crypto_currency/main.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'features/cryptos/data/datasources/datasources.dart';
import 'features/cryptos/data/repositories/repositories.dart';
import 'features/cryptos/domain/usecases/usecases.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton((i) => GetCryptoUsecase(repository: i()));
    i.addLazySingleton((i) => CryptoRepository(datasource: i()));
    i.addLazySingleton((i) => CryptoDatasourceImpl(client: i()));
    i.addLazySingleton((i) => http.Client());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
