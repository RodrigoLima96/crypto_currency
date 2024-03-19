import 'package:flutter_modular/flutter_modular.dart';

import 'features/cryptos/cryptos_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: CryptosModule()),
  ];
}
