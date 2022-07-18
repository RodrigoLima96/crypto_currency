import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return TextButton(
      onPressed: () {
        controller.setFormAction(!controller.isLogin);
      },
      child: Text(controller.toggleButton),
    );
  }
}
