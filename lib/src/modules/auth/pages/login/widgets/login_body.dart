import 'package:crypto_currency/src/modules/auth/controllers/login_controller.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/email_field.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/google_login_button.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/login_button.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/login_text.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/login_text_button.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/password_field.dart';
import 'package:crypto_currency/src/routes/router_utils.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:crypto_currency/src/shared/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = context.read<LoginController>();

    controller.addListener(() {
      if (controller.state == LoginState.error) {
        showSnackBar(context, controller.status);
      } else if (controller.state == LoginState.success) {
        context.goNamed(AppPage.home.toName);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _validadorController = context.read<Validator>();

    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: size.height * 0.25, right: 20, left: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginText(),
              SizedBox(height: size.height * 0.05),
              EmailField(
                emailController: _emailController,
                validator: (value) =>
                    _validadorController.emailValidator(value!),
              ),
              SizedBox(height: size.height * 0.01),
              PasswordField(
                passwordController: _passwordController,
                validator: (value) =>
                    _validadorController.passwordValidator(value!),
              ),
              SizedBox(height: size.height * 0.05),
              LoginButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              SizedBox(height: size.height * 0.1),
              const LoginTextButton(),
              SizedBox(height: size.height * 0.05),
              const GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
