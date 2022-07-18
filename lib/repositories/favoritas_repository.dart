import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency/database/db_firestore.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:crypto_currency/src/models/moeda.dart';
import 'package:crypto_currency/src/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
//import 'package:hive/hive.dart';
//import 'package:crypto_currency/adapters/moeda_hive_adapter.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Moeda> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;
  MoedasRepository moedas;

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  //late LazyBox box;

  FavoritasRepository({required this.auth, required this.moedas}) {
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
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot =
          await db.collection('usuarios/${auth.usuario!.uid}/favoritas').get();

      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach((doc) {
        Moeda moeda = moedas.tabela
            .firstWhere((moeda) => moeda.sigla == doc.get('sigla'));
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

  saveAll(List<Moeda> moedas) {
    // ignore: avoid_function_literals_in_foreach_calls
    moedas.forEach((moeda) async {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
        _lista.add(moeda);
        //box.put(moeda.sigla, moeda);
        await db
            .collection('usuarios/${auth.usuario!.uid}/favoritas')
            .doc(moeda.sigla)
            .set({
          'moeda': moeda.nome,
          'sigla': moeda.sigla,
          'preco': moeda.preco,
        });
      }
    });

    notifyListeners();
  }

  remove(Moeda moeda) async {
    await db
        .collection('usuarios/${auth.usuario!.uid}/favoritas')
        .doc(moeda.sigla)
        .delete();
    _lista.remove(moeda);
    //box.delete(moeda.sigla);

    notifyListeners();
  }
}
