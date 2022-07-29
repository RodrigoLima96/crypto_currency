import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UpdateUserButton extends StatelessWidget {
  final Size size;
  final TextEditingController name;
  final GlobalKey<FormState> formKey;

  const UpdateUserButton({
    Key? key,
    required this.size,
    required this.name,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return controller.state == EditUserState.loading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 50,
            width: size.width * 0.8,
            child: ElevatedButton(
              child: const Text('UPDATE'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.updateUser(name.text);
                  controller.addListener(() {
                    if (controller.state == EditUserState.success) {
                      showSnackBar(context, 'update success');
                      context.pop();
                    }
                  });
                }
              },
            ),
          );
  }
}
