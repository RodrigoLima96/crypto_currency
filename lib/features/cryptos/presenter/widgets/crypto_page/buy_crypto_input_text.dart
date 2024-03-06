import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/utils/utils.dart';
import '../../store/store.dart';

class BuyCryptoInputText extends StatelessWidget {
  final double cryptoPrice;

  const BuyCryptoInputText({
    Key? key,
    required this.cryptoPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final chartStore = Modular.get<CryptoPageStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: amountController,
          style: const TextStyle(fontSize: 22, color: whiteColor),
          decoration: const InputDecoration(
            label: Text(
              "Value",
              style: TextStyle(color: whiteColor),
            ),
            prefix: Icon(
              Icons.monetization_on_outlined,
              size: 15,
              color: whiteColor,
            ),
            suffix: Text(
              "USD",
              style: TextStyle(fontSize: 14, color: whiteColor),
            ),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter the amount";
            } else if (double.parse(value) > 50) {
              return "insufficient balance";
            }
            return null;
          },
          onChanged: (value) {
            chartStore.changeAmount(value: value, price: cryptoPrice);
          },
        ),
      ),
    );
  }
}