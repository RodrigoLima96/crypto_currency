// ignore_for_file: file_names

import 'package:crypto_currency/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../wallet/presenter/store/store.dart';
import '../../../domain/entities/entities.dart';
import '../../store/store.dart';

class BuyCryptoButton extends StatelessWidget {
  final CryptoEntity cryptoEntity;
  final bool purchaseTransaction;
  final GlobalKey<FormState> formKey;
  final TextEditingController amountController;

  const BuyCryptoButton({
    Key? key,
    required this.cryptoEntity,
    required this.purchaseTransaction,
    required this.formKey,
    required this.amountController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletStore = Modular.get<WalletStore>();
    final chartStore = Modular.get<CryptoPageStore>();

    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green.shade300)),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await walletStore.tradeCrypto(
              crypto: cryptoEntity,
              purchaseValue: double.parse(
                amountController.text,
              ),
            );
            await walletStore.getWallet();

            amountController.text = '';
            chartStore.clearCryptoAmount();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check, color: whiteColor),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 15, bottom: 15),
              child: Text(
                purchaseTransaction ? "Buy" : 'Sell',
                style: const TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
