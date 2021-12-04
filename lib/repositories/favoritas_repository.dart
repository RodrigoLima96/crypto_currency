import 'dart:collection';
import 'package:crypto_currency/adapters/moeda_hive_adapter.dart';
import 'package:crypto_currency/models/moeda.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Moeda> _lista = [];

  late LazyBox box;

  FavoritasRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _openBox();
    await _readFavoritas();
  }

  _openBox() async {
    Hive.registerAdapter(MoedaHiveAdapter());
    box = await Hive.openLazyBox<Moeda>('moedas_favoritas');
  }

  _readFavoritas() async {
    // ignore: avoid_function_literals_in_foreach_calls
    box.keys.forEach((moeda) async {
      Moeda m = await box.get(moeda);
      _lista.add(m);
      notifyListeners();
    });
  }

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas) {
    // ignore: avoid_function_literals_in_foreach_calls
    moedas.forEach((moeda) {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
        _lista.add(moeda);
        box.put(moeda.sigla, moeda);
      }
    });

    notifyListeners();
  }

  remove(Moeda moeda) {
    _lista.remove(moeda);
    box.delete(moeda.sigla);
    notifyListeners();
  }
}
