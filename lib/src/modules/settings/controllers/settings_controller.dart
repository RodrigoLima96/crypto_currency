import 'package:flutter/cupertino.dart';
import 'package:crypto_currency/src/repositories/account_repository.dart';

class SettingsController extends ChangeNotifier {
  double _userBalance = 0;
  get userBalance => _userBalance;

  final AccountRepository _accountRepository;

  SettingsController(this._accountRepository);

  getUserBalance() async {
    _userBalance = await _accountRepository.getBalance();
    notifyListeners();
  }

  updateBalance(double value) async {
    await _accountRepository.setBalance(value);
    await getUserBalance();
    notifyListeners();
  }
}
