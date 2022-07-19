import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_controller.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:flutter/material.dart';

class CryptoListController extends ChangeNotifier {
  late List<Crypto> cryptoList;
  List<Crypto> selected = [];
  late MoedasRepository crypto;
  late FavoritasRepository fav;

  cleanSelected() {
    selected = [];
    notifyListeners();
  }
}
