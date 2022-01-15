import 'package:crypto_currency/models/moeda.dart';
import 'package:flutter/cupertino.dart';

class MoedasRepository extends ChangeNotifier {
  List<Moeda> _tabela = [];

  List<Moeda> get tabela => _tabela;

  MoedasRepository() {
    _setupMoedasTable();
  }

  _setupMoedasTable() async {}
}
