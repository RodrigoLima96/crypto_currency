import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_currency/src/repositories/account_repository.dart';

class WalletController extends ChangeNotifier {
  final AccountRepository _accountRepository;
  final CryptoRepository _cryptoRepository;
  double amount = 0;

  List<Wallet> _wallet = [];
  List<Wallet> get wallet => _wallet;

  WalletController(
    this._accountRepository,
    this._cryptoRepository,
  );

  getWallet() async {
    _wallet = [];
    List positions = await _accountRepository.getWallet();

    List<Crypto> cryptos = await _cryptoRepository.readCryptosTable();

    for (var position in positions) {
      Crypto crypto = cryptos.firstWhere(
        (c) => c.symbol == position['symbol'],
      );
      _wallet.add(
        Wallet(
          crypto: crypto,
          amount: double.parse(position['amount']),
        ),
      );
    }
    notifyListeners();
  }

  setAmount(double value) {
    amount = value;
    notifyListeners();
  }

  changeAmount(String value, double price, double total) {
    amount = (value.isEmpty) ? total : double.parse(value) / price;
    notifyListeners();
  }

  cleanAmount() {
    amount = 0;
    notifyListeners();
  }

  sellCrypto(Crypto crypto, String value) async {
    double amount = double.parse(value);
    final double userBalance = await _accountRepository.getBalance();
    await _accountRepository.sellCrypto(crypto, amount, userBalance);

    notifyListeners();
  }
}
