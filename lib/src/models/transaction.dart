import 'package:crypto_currency/src/models/crypto.dart';

class Transaction {
  DateTime dateOperation;
  String typeOperation;
  Crypto crypto;
  double value;
  double amount;

  Transaction({
    required this.dateOperation,
    required this.typeOperation,
    required this.crypto,
    required this.value,
    required this.amount,
  });
}
