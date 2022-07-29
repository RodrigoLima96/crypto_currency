import 'dart:typed_data';
import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:crypto_currency/src/services/auth/auth_service.dart';
import 'package:crypto_currency/src/services/firestore/firestore_service.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_currency/src/repositories/account_repository.dart';

enum EditUserState { idle, loading, success, error }

class SettingsController extends ChangeNotifier {
  double _userBalance = 0;
  get userBalance => _userBalance;
  late model.User user;
  bool loadUserInfo = false;
  Uint8List? image;
  var state = EditUserState.idle;

  final AccountRepository _accountRepository;
  final FirestoreService _firestoreService;
  final AuthService _authService;

  SettingsController(
    this._accountRepository,
    this._firestoreService,
    this._authService,
  ) {
    getUserInfo();
  }

  getUserBalance() async {
    _userBalance = await _accountRepository.getBalance();
    notifyListeners();
  }

  updateBalance(double value) async {
    await _accountRepository.setBalance(value);
    await getUserBalance();
    notifyListeners();
  }

  getUserInfo() async {
    loadUserInfo = true;
    notifyListeners();

    final String uid = await _authService.getUserUid();
    user = await _firestoreService.getCurrentUserDetails(uid);
    loadUserInfo = false;
    notifyListeners();
  }

  addImage() async {
    image = await pickImage();
    notifyListeners();
  }

  clearImage() {
    image = null;
    notifyListeners();
  }

  logout() async {
    _authService.logout();
  }
}
