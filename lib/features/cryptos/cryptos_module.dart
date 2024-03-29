import 'package:crypto_currency/features/wallet/wallet_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';
import 'domain/entities/entities.dart';
import 'domain/usecases/usecases.dart';
import 'presenter/pages/pages.dart';
import 'presenter/store/store.dart';

class CryptosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => GetCryptoListUsecase(repository: i())),
    Bind.lazySingleton((i) => GetCryptoPricesUsecase(repository: i())),
    Bind.lazySingleton((i) => CryptoRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => CryptoDatasourceImpl(client: i())),
    Bind.lazySingleton((i) => CryptoListStore(usecase: i())),
    Bind.lazySingleton((i) => CryptoPageStore(usecase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const CryptoListPage()),
    ChildRoute(
      '/crypto',
      child: (_, args) => CryptoPage(cryptoEntity: args.data as CryptoEntity),
    ),
  ];
  
  @override
  List<Module> get imports => [WalletModule()];
}
