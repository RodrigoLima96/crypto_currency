import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/wallet/controllers/wallet_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SellCryptoButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController amountController;
  final Crypto crypto;

  const SellCryptoButton({
    Key? key,
    required this.formKey,
    required this.amountController,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<WalletController>();
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await controller.sellCrypto(crypto, amountController.text);
            await controller.getWallet();
            showSnackBar(context, 'Successful');
            context.pop();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
              child: Text(
                "Sell",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
