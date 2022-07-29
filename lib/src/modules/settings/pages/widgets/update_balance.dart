import 'package:crypto_currency/src/modules/settings/pages/widgets/update_balance_dialog.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';

class UpdateBalance extends StatelessWidget {
  final TextEditingController balanceController;
  final GlobalKey<FormState> formKey;

  const UpdateBalance({
    Key? key,
    required this.balanceController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double balance = 250;

    return ListTile(
      title: const Text('Balance'),
      subtitle: Text(
        price.format(balance),
        style: TextStyle(fontSize: 25, color: Colors.green.shade300),
      ),
      trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => UpdateBalanceDialog(
                balanceController: balanceController,
                formKey: formKey,
              ),
            );
          },
          icon: const Icon(Icons.edit)),
    );
  }
}
