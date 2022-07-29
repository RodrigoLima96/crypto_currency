import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:crypto_currency/src/routes/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditUserButton extends StatelessWidget {
  const EditUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();
    return IconButton(
        onPressed: () {
          context.push(
            AppPage.editUser.toPath,
            extra: controller.user,
          );
        },
        icon: const Icon(Icons.edit));
  }
}
