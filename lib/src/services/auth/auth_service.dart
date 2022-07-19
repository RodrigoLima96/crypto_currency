import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String status = 'error';

  Future<dynamic> singUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      status = 'success';
      return credential;
    } catch (e) {
      status = e.toString();
      return status;
    }
  }

  Future<String> login(String email, String password) async {
    String response = 'Error';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      response = 'success';
      return response;
    } catch (e) {
      response = e.toString();
      return response;
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      return e.toString();
    }
  }

  Future<UserCredential?> googleLogin() async {
    final googleSignIn = GoogleSignIn();

    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential credentialGoogle =
          await _auth.signInWithCredential(credential);
      return credentialGoogle;
    } catch (e) {
      status = e.toString();
    }
    return null;
  }

  getUserUid() {
    String uid = _auth.currentUser!.uid;
    return uid;
  }
}
