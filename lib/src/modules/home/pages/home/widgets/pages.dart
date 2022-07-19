import 'package:crypto_currency/pages/carteira/carteira_page.dart';
import 'package:crypto_currency/pages/configuracoes/configuracoes_page.dart';
import 'package:crypto_currency/pages/historico/historico_page.dart';
import 'package:crypto_currency/pages/moeda/favoritas_page.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/pages/crypto_list_page.dart';
import 'package:flutter/material.dart';

List<Widget> appPages = const [
  CryptoListPage(),
  FavoritasPage(),
  CarteiraPage(),
  HistoricoPage(),
  ConfiguracoesPage(),
];
