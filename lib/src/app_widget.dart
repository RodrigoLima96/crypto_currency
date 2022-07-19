import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_settings_controller.dart';
import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_list_controller.dart';
import 'package:crypto_currency/src/routes/app_router.dart';
import 'package:crypto_currency/src/services/auth/auth_service.dart';
import 'package:crypto_currency/src/services/firestore/firestore_service.dart';
import 'package:crypto_currency/src/shared/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter _appRouter = AppRouter();

    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        Provider(create: (_) => FirestoreService()),
        Provider(create: (_) => Validator()),
        ChangeNotifierProvider(
          create: (context) => LoginController(
            context.read(),
            context.read(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => CryptoSettingsController()),
        ChangeNotifierProvider(
            create: (context) => CryptoListController(context.read())),
        ChangeNotifierProvider(create: (context) => MoedasRepository()),
        ChangeNotifierProvider(
          create: (context) => ContaRepository(
            moedas: context.read<MoedasRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritasRepository(
            moedas: context.read<MoedasRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        routeInformationParser: _appRouter.router.routeInformationParser,
        routerDelegate: _appRouter.router.routerDelegate,
      ),
    );
  }
}
