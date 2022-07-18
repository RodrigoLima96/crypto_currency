import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Senha',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe a senha';
        } else if (value.length < 6) {
          return 'A senha deve conter no mínimo 6 caracteres';
        }
        return null;
      },
    );
  }
}
