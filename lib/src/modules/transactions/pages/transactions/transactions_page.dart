import 'package:crypto_currency/src/modules/transactions/pages/transactions/widgets/transactions_body.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TransactionsBody(),
    );
  }
}
