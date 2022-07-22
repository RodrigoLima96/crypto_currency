import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/buy_crypto_body.dart';
import 'package:flutter/material.dart';

class BuyCryptoPage extends StatelessWidget {
  final Crypto crypto;
  const BuyCryptoPage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuyCryptoBody(),
    );
  }
}
