import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return Text(
      controller.tittle,
      style: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
      ),
    );
  }
}
