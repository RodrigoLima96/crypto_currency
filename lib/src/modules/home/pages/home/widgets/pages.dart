import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos/all_cryptos_page.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/buy_crypto_page.dart';
import 'package:crypto_currency/src/modules/favorites/pages/favorites_page.dart';
import 'package:crypto_currency/src/modules/settings/pages/settings_page.dart';
import 'package:crypto_currency/src/modules/transactions/pages/transactions_page.dart';
import 'package:crypto_currency/src/modules/wallet/pages/wallet_page.dart';
import 'package:flutter/material.dart';

List<Widget> appPages = [
  BuyCryptoPage(
    crypto: Crypto(
      id: '5b71fc48-3dd3-540c-809b-f8c94d0e68b5',
      icon:
          'https://dynamic-assets.coinbase.com/e785e0181f1a23a30d9476038d9be91e9f6c63959b538eabbc51a1abc8898940383291eede695c3b8dfaa1829a9b57f5a2d0a16b0523580346c6b8fab67af14b/asset_icons/b57ac673f06a4b0338a596817eb0a50ce16e2059f327dc117744449a47915cb2.png',
      name: 'Bitcoin',
      symbol: 'BTC',
      price: 23271.7,
      timeStamp: DateTime.parse('2022-07-22T15:52:32+00:00'),
      changeHour: -0.015451251685921751,
      changeDay: 0.029581379874503818,
      changeWeek: 0.11954759533740324,
      changeMonth: 0.16076955344811172,
      changeYear: -0.2792405788573065,
      changeAllTime: 220.93961242084384,
    ),
  ),
  FavoritesPage(),
  WalletPage(),
  TransactionsPage(),
  SettingsPage(),
];
