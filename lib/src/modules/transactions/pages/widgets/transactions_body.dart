import 'package:crypto_currency/src/modules/transactions/controllers/transactions_controller.dart';
import 'package:crypto_currency/src/modules/transactions/pages/widgets/total_wallet_amount.dart';
import 'package:crypto_currency/src/modules/transactions/pages/widgets/transactions_history.dart';
import 'package:crypto_currency/src/modules/transactions/pages/widgets/wallet_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsBody extends StatefulWidget {
  const TransactionsBody({Key? key}) : super(key: key);

  @override
  State<TransactionsBody> createState() => _TransactionsBodyState();
}

class _TransactionsBodyState extends State<TransactionsBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TransactionsController>().setData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            TotalWalletAmount(),
            WalletChart(),
            TransactionsHistory(),
          ],
        ),
      ),
    );
  }
}
