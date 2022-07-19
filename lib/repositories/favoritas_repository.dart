import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency/database/db_firestore.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_controller.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:flutter/cupertino.dart';
//import 'package:hive/hive.dart';
//import 'package:crypto_currency/adapters/moeda_hive_adapter.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Crypto> _lista = [];
  late FirebaseFirestore db;
  MoedasRepository moedas;

  UnmodifiableListView<Crypto> get lista => UnmodifiableListView(_lista);

  //late LazyBox box;

  FavoritasRepository({required this.moedas}) {
    _startRepository();
  }

  _startRepository() async {
    //await _openBox();
    await _startFirestore();
    await _readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  /*  _openBox() async {
      Hive.registerAdapter(MoedaHiveAdapter());
      box = await Hive.openLazyBox<Moeda>('moedas_favoritas');
   } */

  _readFavoritas() async {
    if (_lista.isEmpty) {
      final snapshot = await db
          .collection('usuarios/beqoWt3n09all8XNDe8BMjOg2Mr1/favoritas')
          .get();

      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach((doc) {
        Crypto moeda = moedas.table
            .firstWhere((moeda) => moeda.symbol == doc.get('sigla'));
        _lista.add(moeda);
        notifyListeners();
      });
    }

    /*box.keys.forEach((moeda) async {
      Moeda m = await box.get(moeda);
      _lista.add(m);
      notifyListeners();
    });*/
  }

  saveAll(List<Crypto> moedas) {
    // ignore: avoid_function_literals_in_foreach_calls
    moedas.forEach((moeda) async {
      if (!_lista.any((atual) => atual.symbol == moeda.symbol)) {
        _lista.add(moeda);
        //box.put(moeda.sigla, moeda);
        await db
            .collection('usuarios/beqoWt3n09all8XNDe8BMjOg2Mr1/favoritas')
            .doc(moeda.symbol)
            .set({
          'moeda': moeda.name,
          'sigla': moeda.symbol,
          'preco': moeda.price,
        });
      }
    });

    notifyListeners();
  }

  remove(Crypto moeda) async {
    await db
        .collection('usuarios/beqoWt3n09all8XNDe8BMjOg2Mr1/favoritas')
        .doc(moeda.symbol)
        .delete();
    _lista.remove(moeda);
    //box.delete(moeda.sigla);

    notifyListeners();
  }
}
