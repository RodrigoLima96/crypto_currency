import 'package:crypto_currency/src/modules/all_cryptos/controllers/account_controller.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BuyCryptoInputText extends StatefulWidget {
  final TextEditingController amountController;
  final FormFieldValidator<String> validator;
  final GlobalKey<FormState> formKey;
  final double cryptoPrice;

  const BuyCryptoInputText({
    Key? key,
    required this.amountController,
    required this.validator,
    required this.formKey,
    required this.cryptoPrice,
  }) : super(key: key);

  @override
  State<BuyCryptoInputText> createState() => _BuyCryptoInputTextState();
}

class _BuyCryptoInputTextState extends State<BuyCryptoInputText> {
  @override
  void initState() {
    super.initState();
    context.read<AccountController>().getUserBalance();
  }

  @override
  Widget build(BuildContext context) {
    final accountController = context.watch<AccountController>();
    final buyCryptoController = context.watch<BuyCryptoPageController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          controller: widget.amountController,
          style: const TextStyle(fontSize: 22),
          decoration: const InputDecoration(
            label: Text("Value"),
            prefix: Icon(
              Icons.monetization_on_outlined,
              size: 15,
            ),
            suffix: Text(
              "USD",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter the amount";
            } else if (double.parse(value) > accountController.userBalance) {
              return "insufficient balance";
            }
            return null;
          },
          onChanged: (value) {
            buyCryptoController.changeAmount(value, widget.cryptoPrice);
          },
        ),
      ),
    );
  }
}
