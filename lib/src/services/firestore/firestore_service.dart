import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(String uid, Map<String, dynamic> user) async {
    String status = '';

    try {
      await _firestore.collection('users').doc(uid).set(user);
      status = 'success';
    } catch (error) {
      status = error.toString();
    }

    return status;
  }

  Future<model.User> getCurrentUserDetails(String uid) async {
    DocumentSnapshot snap = await _firestore.collection('users').doc(uid).get();

    return model.User.fromMap(snap);
  }

  getFavCryptos(String uid) async {
    List<Crypto> favCryptos = [];

    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .get();

      for (var doc in snapshot.docs) {
        Crypto crypto = Crypto.fromMap(doc);
        favCryptos.add(crypto);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return favCryptos;
  }

  saveFavCryptos(List<Crypto> cryptos, String uid) async {
    try {
      for (var crypto in cryptos) {
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('favorites')
            .doc(crypto.symbol)
            .set(
              crypto.toMap(),
            );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  removeFavCrypto(Crypto crypto, String uid) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .doc(crypto.symbol)
          .delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
