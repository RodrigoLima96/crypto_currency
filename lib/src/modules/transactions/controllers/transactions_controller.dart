import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/models/transaction.dart';
import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/repositories/account_repository.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';
import 'package:flutter/material.dart';

class TransactionsController extends ChangeNotifier {
  double balance = 0;
  double totalBalance = 0;

  List<Transaction> _transactions = [];
  List<Transaction> get transaction => _transactions;

  List<Wallet> _wallet = [];
  List<Wallet> get wallet => _wallet;

  final AccountRepository _accountRepository;
  final CryptoRepository _cryptoRepository;

  TransactionsController(this._accountRepository, this._cryptoRepository);
  setData() async {
    balance = await _accountRepository.getBalance();

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

    totalBalance = balance;

    for (var position in _wallet) {
      totalBalance += position.crypto.price * position.amount;
    }

    notifyListeners();

    _transactions = [];
    List transactionsDB = await _accountRepository.getTransactions();

    for (var operation in transactionsDB) {
      Crypto crypto = cryptos.firstWhere(
        (m) => m.symbol == operation['symbol'],
      );
      _transactions.add(
        Transaction(
          dateOperation:
              DateTime.fromMillisecondsSinceEpoch(operation['date_operation']),
          typeOperation: operation['type_operation'],
          crypto: crypto,
          value: operation['value'],
          amount: double.parse(operation['amount']),
        ),
      );
    }
    notifyListeners();
  }
}
