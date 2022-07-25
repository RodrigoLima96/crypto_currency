import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BuyCryptoInputText extends StatelessWidget {
  final TextEditingController amountController;
  final FormFieldValidator<String> validator;

  const BuyCryptoInputText({
    Key? key,
    required this.amountController,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BuyCryptoController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: amountController,
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
        validator: validator,
        // if (value!.isEmpty) {
        //   return "Informe o valor da compra";
        // } else if (double.parse(value) < 50) {
        //   return "A compra mínima é R\$ 50,00";
        // } else if (double.parse(value) > controller.balance) {
        //   return "Saldo insuficiente";
        // }
        // return null;

        onChanged: (value) {
          // setState(() {
          //   quantidade =
          //       (value.isEmpty) ? 0 : double.parse(value) / widget.moeda.preco;
          // });
        },
      ),
    );
  }
}
