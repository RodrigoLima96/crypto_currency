import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = context.watch<LoginController>();

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (loginController.isLogin) {
              loginController.login(
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              loginController.signUp(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (loginController.state == LoginState.loading)
              ? [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]
              : [
                  const Icon(Icons.check),
                  Text(
                    loginController.actionButton,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
        ),
      ),
    );
  }
}
