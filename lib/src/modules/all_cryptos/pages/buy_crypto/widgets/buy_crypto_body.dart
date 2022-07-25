import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/buy_crypto_button.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/buy_crypto_input_text.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/crypto_amount.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/chart/crypto_chart.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/image_and_price.dart';
import 'package:flutter/material.dart';

class BuyCryptoBody extends StatelessWidget {
  final Crypto crypto;
  const BuyCryptoBody({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndPrice(image: crypto.icon, cryptoPrice: crypto.price),
            const SizedBox(height: 20),
            CryptoChart(crypto: crypto),
            const SizedBox(height: 40),
            CryptoAmount(symbol: crypto.symbol),
            BuyCryptoInputText(
              amountController: _amountController,
              validator: (value) => null,
            ),
            const BuyCryptoButton(),
          ],
        ),
      ),
    );
  }
}
