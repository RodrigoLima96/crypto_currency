import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return ElevatedButton(
        onPressed: () {
          controller.loginWithGoogle();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (controller.loadingGoogle)
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                      height: 40,
                      color: Colors.red.shade300,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Text(
                      'Logar com o Google',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
        ));
  }
}
