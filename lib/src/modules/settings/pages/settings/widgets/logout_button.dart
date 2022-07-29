import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:crypto_currency/src/routes/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = context.read<SettingsController>();

    return SizedBox(
      height: 50,
      width: size.width * 0.8,
      child: OutlinedButton(
        onPressed: () {
          controller.logout();
          context.goNamed(AppPage.login.toName);
        },
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.red.shade400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
