import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:crypto_currency/src/services/auth_service.dart';
import 'package:crypto_currency/src/shared/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => MoedasRepository()),
        ChangeNotifierProvider(
          create: (context) => ContaRepository(
            moedas: context.read<MoedasRepository>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(
          create: (context) => FavoritasRepository(
            auth: context.read<AuthService>(),
            moedas: context.read<MoedasRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const AuthCheck(),
      ),
    );
  }
}
