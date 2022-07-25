import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCryptoButton extends StatelessWidget {
  final Crypto crypto;
  final GlobalKey<FormState> formKey;
  final TextEditingController amountController;

  const BuyCryptoButton({
    Key? key,
    required this.formKey,
    required this.amountController,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AccountController>();
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            controller.buyCrypto(crypto, amountController.text);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
              child: Text(
                "Buy",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
