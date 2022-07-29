import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/buy_crypto_page.dart';
import 'package:crypto_currency/src/modules/home/pages/home/home_page.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/login_page.dart';
import 'package:crypto_currency/src/modules/settings/pages/editUser/edit_user_page.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/sell_crypto_page.dart';
import 'package:crypto_currency/src/routes/router_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser == null
        ? AppPage.login.toPath
        : AppPage.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppPage.login.toPath,
        name: AppPage.login.toName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppPage.buyCrypto.toPath,
        name: AppPage.buyCrypto.toName,
        builder: (context, state) => BuyCryptoPage(
          crypto: state.extra! as Crypto,
        ),
      ),
      GoRoute(
        path: AppPage.sellCrypto.toPath,
        name: AppPage.sellCrypto.toName,
        builder: (context, state) => SellCryptoPage(
          wallet: state.extra! as Wallet,
        ),
      ),
      GoRoute(
        path: AppPage.editUser.toPath,
        name: AppPage.editUser.toName,
        builder: (context, state) => EditUserPage(
          user: state.extra! as model.User,
        ),
      ),
    ],
  );
}
