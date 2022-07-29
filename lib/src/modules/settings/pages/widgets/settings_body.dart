import 'package:crypto_currency/src/modules/settings/pages/widgets/edit_user_button.dart';
import 'package:crypto_currency/src/modules/settings/pages/widgets/logout_button.dart';
import 'package:crypto_currency/src/modules/settings/pages/widgets/update_balance.dart';
import 'package:crypto_currency/src/modules/settings/pages/widgets/user_info.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _balanceController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UpdateBalance(
              balanceController: _balanceController,
              formKey: _formKey,
            ),
            const Divider(),
            const SizedBox(height: 40),
            const UserInfo(),
            const EditUserButton(),
            SizedBox(height: size.height * 0.3),
            const LogOutButton(),
          ],
        ),
      ),
    );
  }
}
