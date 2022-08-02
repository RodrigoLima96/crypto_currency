import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos/all_cryptos_page.dart';
import 'package:crypto_currency/src/modules/favorites/pages/favorites/favorites_page.dart';
import 'package:crypto_currency/src/modules/settings/pages/settings/settings_page.dart';
import 'package:crypto_currency/src/modules/transactions/pages/transactions/transactions_page.dart';
import 'package:crypto_currency/src/modules/wallet/pages/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

List<Widget> appPages = const [
  AllCryptosPage(),
  FavoritesPage(),
  WalletPage(),
  TransactionsPage(),
  SettingsPage(),
];
