import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoAmount extends StatelessWidget {
  final String symbol;
  const CryptoAmount({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BuyCryptoController>();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: (controller.amount > 0)
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "${controller.amount} $symbol",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green.shade300,
                  ),
                ))
            : null,
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green.shade500.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
