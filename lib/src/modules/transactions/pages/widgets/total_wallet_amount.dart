import 'package:crypto_currency/src/modules/transactions/controllers/transactions_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalWalletAmount extends StatelessWidget {
  const TotalWalletAmount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionsController>();
    return Column(
      children: [
        const Text(
          'Total wallet amount',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          price.format(controller.totalBalance),
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.5,
          ),
        ),
      ],
    );
  }
}
