import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:crypto_currency/src/services/auth/auth_service.dart';
import 'package:crypto_currency/src/services/firestore/firestore_service.dart';
import 'package:flutter/material.dart';

enum LoginState { idle, loading, loadingGoogle, success, error }

class LoginController extends ChangeNotifier {
  bool isLogin = true;
  late String tittle;
  late String actionButton;
  late String toggleButton;
  bool loadingGoogle = false;
  var state = LoginState.idle;
  String status = 'error';

  final AuthService _authService;
  final FirestoreService _firestoreService;

  LoginController(
    this._authService,
    this._firestoreService,
  ) {
    setFormAction(true);
  }

  setFormAction(bool action) {
    isLogin = action;
    if (isLogin) {
      tittle = 'Welcome';
      actionButton = 'Login';
      toggleButton = 'Don\'t have an account yet? SingUp';
    } else {
      tittle = 'SignUp';
      actionButton = 'SignUp';
      toggleButton = 'Login';
    }
    notifyListeners();
  }

  login({
    required String email,
    required String password,
  }) async {
    state = LoginState.loading;
    notifyListeners();
    try {
      await _authService.login(email, password);
      status = 'success';
      state = LoginState.success;
      notifyListeners();
    } catch (e) {
      state = LoginState.error;
      notifyListeners();
    }
  }

  signUp({
    required String email,
    required String password,
  }) async {
    state = LoginState.loading;
    notifyListeners();

    try {
      var credential = await _authService.singUp(email, password);
      model.User user = model.User(
        uid: credential.user!.uid,
        email: email,
        name: '',
      );
      await _firestoreService.signUpUser(user.uid, user.toMap());
      status = 'success';

      state = LoginState.success;
      notifyListeners();
    } catch (e) {
      state = LoginState.error;
      notifyListeners();
    }
  }

  loginWithGoogle() async {
    state = LoginState.loadingGoogle;
    notifyListeners();
    try {
      var credential = await _authService.googleLogin();

      if (credential != null) {
        model.User user = model.User(
          email: credential.user!.email!,
          uid: credential.user!.uid,
          name: credential.user!.displayName!,
          photoUrl: credential.user!.photoURL ?? '',
        );
        await _firestoreService.signUpUser(user.uid, user.toMap());
        state = LoginState.success;
        notifyListeners();
      }
      state = LoginState.idle;
      notifyListeners();
    } catch (e) {
      state = LoginState.error;
      notifyListeners();
    }
  }
}
