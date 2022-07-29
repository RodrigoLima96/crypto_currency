import 'package:crypto_currency/src/modules/transactions/controllers/transactions_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionsHistory extends StatelessWidget {
  const TransactionsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionsController>();
    final date = DateFormat('dd/MM/yyyy - hh:mm');
    List<Widget> widgets = [];

    List.generate(
      controller.transaction.length,
      (i) => {
        widgets.add(
          ListTile(
            title: Text(controller.transaction[i].crypto.name),
            subtitle:
                Text(date.format(controller.transaction[i].dateOperation)),
            trailing: Text(
              price.format(controller.transaction[i].crypto.price *
                  controller.transaction[i].amount),
            ),
            leading: (controller.transaction[i].typeOperation == 'buy')
                ? const Icon(
                    Icons.arrow_upward,
                    color: Colors.blue,
                  )
                : const Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
          ),
        ),
        widgets.add(const Divider()),
      },
    );
    return Column(
      children: widgets,
    );
  }
}
