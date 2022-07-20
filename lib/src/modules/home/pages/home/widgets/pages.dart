import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos_page.dart';
import 'package:crypto_currency/src/modules/favorites/pages/favorites_page.dart';
import 'package:crypto_currency/src/modules/settings/pages/settings_page.dart';
import 'package:crypto_currency/src/modules/transactions/pages/transactions_page.dart';
import 'package:crypto_currency/src/modules/wallet/pages/wallet_page.dart';
import 'package:flutter/material.dart';

List<Widget> appPages = const [
  AllCryptosPage(),
  FavoritesPage(),
  WalletPage(),
  TransactionsPage(),
  SettingsPage(),
];