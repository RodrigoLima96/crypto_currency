import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';

class TotalCryptoUSD extends StatelessWidget {
  final double total;

  const TotalCryptoUSD({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Total',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          price.format(
            (total),
          ),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}
