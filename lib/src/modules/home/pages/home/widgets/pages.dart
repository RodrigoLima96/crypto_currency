import 'package:crypto_currency/src/models/user.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos/all_cryptos_page.dart';
import 'package:crypto_currency/src/modules/favorites/pages/favorites_page.dart';
import 'package:crypto_currency/src/modules/settings/pages/editUser/edit_user_page.dart';
import 'package:crypto_currency/src/modules/settings/pages/settings/settings_page.dart';
import 'package:crypto_currency/src/modules/transactions/pages/transactions_page.dart';
import 'package:crypto_currency/src/modules/wallet/pages/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

List<Widget> appPages = [
  // AllCryptosPage(),
  EditUserPage(
    user: User(
      uid: '1234',
      name: 'Rodrigo Lima',
      email: 'rodrigolima9657@gmail.com',
      photoUrl:
          'https://lh3.googleusercontent.com/a-/AFdZucr88jlKQnuKUzGg-KdilpVlKDDAENHlClCGYdRTnA=s96-c',
    ),
  ),
  FavoritesPage(),
  WalletPage(),
  TransactionsPage(),
  SettingsPage(),
];
