import 'package:flutter_modular/flutter_modular.dart';

import '../database/local/local.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    // local database
    Bind.singleton((i) => LocalDatabaseService(localDatabaseService: InitDatabaseService.instance), export: true),
  ];
}