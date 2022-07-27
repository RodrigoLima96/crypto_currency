import 'package:crypto_currency/src/modules/wallet/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellCryptoForm extends StatelessWidget {
  final TextEditingController amountController;
  final GlobalKey<FormState> formKey;
  final String symbol;
  final double cryptoPrice;
  final double total;
  final double cryptoAmount;

  const SellCryptoForm({
    Key? key,
    required this.amountController,
    required this.formKey,
    required this.symbol,
    required this.cryptoPrice,
    required this.total,
    required this.cryptoAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WalletController>();

    return Form(
      key: formKey,
      child: TextFormField(
        controller: amountController,
        style: const TextStyle(fontSize: 22),
        decoration: const InputDecoration(
          label: Text('Value'),
          prefix: Icon(
            Icons.monetization_on_outlined,
            size: 15,
          ),
          suffix: Text(
            'USD',
            style: TextStyle(fontSize: 14),
          ),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter the amount';
          } else if (double.parse(value) >
              double.parse(total.toStringAsFixed(2))) {
            return 'Insufficient amount of $symbol in wallet';
          }
          return null;
        },
        onChanged: (value) {
          controller.changeAmount(value, cryptoPrice, cryptoAmount);
        },
      ),
    );
  }
}
