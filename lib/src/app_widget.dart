import 'package:crypto_currency/src/modules/all_cryptos/controllers/account_controller.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_page_controller.dart';
import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:crypto_currency/src/repositories/account_repository.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';
import 'package:crypto_currency/src/routes/app_router.dart';
import 'package:crypto_currency/src/services/auth/auth_service.dart';
import 'package:crypto_currency/src/services/crypto_info_service/crypto_info_service.dart';
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
        Provider(create: (_) => CryptoInfoService()),
        ChangeNotifierProvider(
          create: (context) => LoginController(
            context.read(),
            context.read(),
          ),
        ),
        Provider(create: (context) => CryptoRepository(context.read())),
        ChangeNotifierProvider(
          create: (context) => AllCryptoController(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => BuyCryptoPageController(context.read()),
        ),
        Provider(create: (context) => AccountRepository()),
        ChangeNotifierProvider(
          create: (context) =>
              AccountController(context.read(), context.read()),
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
