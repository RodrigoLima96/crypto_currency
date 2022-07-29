import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UpdateBalanceDialog extends StatelessWidget {
  final TextEditingController balanceController;
  final GlobalKey<FormState> formKey;

  const UpdateBalanceDialog({
    Key? key,
    required this.balanceController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SettingsController>();

    return AlertDialog(
      title: const Text(
        'Update Balance',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: balanceController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
          ],
          validator: (value) {
            if (value!.isEmpty) return 'Enter the balance amount';
            return null;
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final double value = double.parse(balanceController.text);
                  await controller.updateBalance(value);
                  Navigator.pop(context);
                }
              },
              child: const Text('SAVE'),
            )
          ],
        ),
      ],
    );
  }
}
