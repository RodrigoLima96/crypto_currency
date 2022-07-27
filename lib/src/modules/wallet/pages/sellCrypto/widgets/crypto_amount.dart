import 'package:crypto_currency/src/modules/wallet/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoAmount extends StatelessWidget {
  const CryptoAmount({
    Key? key,
    required this.size,
    required this.amount,
  }) : super(key: key);

  final Size size;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WalletController>();
    return SizedBox(
      width: size.width,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            controller.amount.toString(),
            style: TextStyle(
              fontSize: 25,
              color: Colors.green.shade300,
            ),
          ),
        ),
        margin: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green.shade500.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
