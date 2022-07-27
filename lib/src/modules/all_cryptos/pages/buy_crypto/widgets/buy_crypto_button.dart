import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/account_controller.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_page_controller.dart';
import 'package:crypto_currency/src/routes/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final buyController = context.read<BuyCryptoPageController>();
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await controller.buyCrypto(crypto, amountController.text);
            context.goNamed(AppPage.home.toName);
            await buyController.cleanAmount();
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
