import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();
    return controller.loadUserInfo
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  backgroundImage: (controller.user.photoUrl != null)
                      ? NetworkImage(controller.user.photoUrl!)
                      : const NetworkImage(
                          'https://cdn.icon-icons.com/icons2/933/PNG/512/round-account-button-with-user-inside_icon-icons.com_72596.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(controller.user.email),
            ],
          );
  }
}
