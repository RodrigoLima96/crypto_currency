import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:crypto_currency/src/modules/settings/pages/settings/widgets/update_balance_dialog.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateBalance extends StatefulWidget {
  final TextEditingController balanceController;
  final GlobalKey<FormState> formKey;

  const UpdateBalance({
    Key? key,
    required this.balanceController,
    required this.formKey,
  }) : super(key: key);

  @override
  State<UpdateBalance> createState() => _UpdateBalanceState();
}

class _UpdateBalanceState extends State<UpdateBalance> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SettingsController>().getUserBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return ListTile(
      title: const Text('Balance'),
      subtitle: Text(
        price.format(controller.userBalance),
        style: TextStyle(fontSize: 25, color: Colors.green.shade300),
      ),
      trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => UpdateBalanceDialog(
                balanceController: widget.balanceController,
                formKey: widget.formKey,
              ),
            );
          },
          icon: const Icon(Icons.edit)),
    );
  }
}
