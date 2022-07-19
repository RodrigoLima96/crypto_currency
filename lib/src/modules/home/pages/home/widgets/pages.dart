import 'package:crypto_currency/pages/carteira/carteira_page.dart';
import 'package:crypto_currency/pages/configuracoes/configuracoes_page.dart';
import 'package:crypto_currency/pages/historico/historico_page.dart';
import 'package:crypto_currency/pages/moeda/favoritas_page.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/pages/crypto_list2.dart';
import 'package:flutter/material.dart';

List<Widget> appPages = const [
  CryptoListPage2(),
  FavoritasPage(),
  CarteiraPage(),
  HistoricoPage(),
  ConfiguracoesPage(),
];
