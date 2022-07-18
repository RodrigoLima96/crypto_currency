import 'package:crypto_currency/src/modules/auth/pages/login/widgets/email_field.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/google_login_button.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/login_button.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/login_text.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/login_text_button.dart';
import 'package:crypto_currency/src/modules/auth/pages/login/widgets/password_field.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              EmailField(emailController: _emailController),
              SizedBox(height: size.height * 0.01),
              PasswordField(passwordController: _passwordController),
              SizedBox(height: size.height * 0.05),
              LoginButton(formKey: _formKey),
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
