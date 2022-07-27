import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/widgets/sell_crypto_body.dart';
import 'package:crypto_currency/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class SellCryptoPage extends StatelessWidget {
  final Wallet wallet;
  const SellCryptoPage({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell ${wallet.crypto.name.toString()}'),
        centerTitle: true,
        backgroundColor: blackColor,
      ),
      body: SellCryptoBody(wallet: wallet),
    );
  }
}
