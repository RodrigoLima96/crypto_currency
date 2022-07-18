import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  bool isLogin = true;
  late String tittle;
  late String actionButton;
  late String toggleButton;

  bool loading = false;
  bool loadingGoogle = false;

  LoginController() {
    setFormAction(true);
  }

  setFormAction(bool action) {
    isLogin = action;
    if (isLogin) {
      tittle = 'Bem vindo';
      actionButton = 'Login';
      toggleButton = 'Ainda não tem conta? Cadastre-se agora';
    } else {
      tittle = 'Crie sua conta';
      actionButton = 'Cadastrar';
      toggleButton = 'Voltar ao Login';
    }
    notifyListeners();
  }

  login() async {
    loading = true;
    notifyListeners();
    try {
      // await context.read<AuthService>().login(email.text, senha.text);
    } catch (e) {
      print(e.toString());
    }
  }

  signUp() async {
    loading = true;
    notifyListeners();
    try {
      // await context.read<AuthService>().registrar(email.text, senha.text);
    } catch (e) {
      print(e.toString());
    }
  }

  loginWithGoogle() async {
    loadingGoogle = true;
    notifyListeners();
    try {
      // await context.read<AuthService>().googleLogin();
    } catch (e) {
      print(e.toString());
    }
  }
}
