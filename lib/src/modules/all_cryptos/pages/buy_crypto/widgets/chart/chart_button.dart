import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartButton extends StatelessWidget {
  final Period p;
  final String label;
  const ChartButton({Key? key, required this.label, required this.p})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BuyCryptoPageController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
        onPressed: () => controller.changePeriod(p),
        child: Text(label),
        style: (controller.period != p)
            ? ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
              )
            : ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(controller.colors[0]),
                backgroundColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
              ),
      ),
    );
  }
}
