import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              onPressed: () {
                if (formKey.currentState!.validate()) {
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
