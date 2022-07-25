import 'package:crypto_currency/src/models/crypto.dart';

class Wallet {
  Crypto crypto;
  double amount;

  Wallet({
    required this.crypto,
    required this.amount,
  });
}
