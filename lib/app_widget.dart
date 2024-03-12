import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
      ).modular(),
    );
  }
}