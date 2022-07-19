import 'package:cloud_firestore/cloud_firestore.dart';

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
}
