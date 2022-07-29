import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/models/transaction.dart';
import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_currency/src/repositories/account_repository.dart';

class AccountController extends ChangeNotifier {
  final AccountRepository _accountRepository;
  final CryptoRepository _cryptoRepository;

  List<Wallet> _wallet = [];
  List<Transaction> _transactions = [];
  double _userBalance = 0;
  get userBalance => _userBalance;
  List<Wallet> get wallet => _wallet;
  List<Transaction> get transactions => _transactions;

  AccountController(
    this._accountRepository,
    this._cryptoRepository,
  ) {
    getUserBalance();
    _getWallet();
    _getTransactions();
  }

  getUserBalance() async {
    _userBalance = await _accountRepository.getBalance();
    notifyListeners();
  }

  _getWallet() async {
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

  _getTransactions() async {
    _transactions = [];
    List userTransactions = await _accountRepository.getTransactions();

    List<Crypto> cryptos = await _cryptoRepository.readCryptosTable();

    for (var transaction in userTransactions) {
      Crypto crypto = cryptos.firstWhere(
        (c) => c.symbol == transaction['symbol'],
      );
      _transactions.add(
        Transaction(
          dateOperation: DateTime.fromMillisecondsSinceEpoch(
              transaction['date_operation']),
          typeOperation: transaction['type_operation'],
          crypto: crypto,
          value: transaction['value'],
          amount: double.parse(transaction['amount']),
        ),
      );
    }
    notifyListeners();
  }

  buyCrypto(Crypto crypto, String value) async {
    double amount = double.parse(value);
    await _accountRepository.buyCrypto(crypto, amount, userBalance);
    await getUserBalance();
    notifyListeners();
  }
}
