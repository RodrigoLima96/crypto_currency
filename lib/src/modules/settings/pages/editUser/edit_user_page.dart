import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:crypto_currency/src/modules/settings/pages/editUser/widgets/edit_user_body.dart';
import 'package:flutter/material.dart';

class EditUserPage extends StatelessWidget {
  final model.User user;
  const EditUserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditUserBody(user: user),
    );
  }
}
