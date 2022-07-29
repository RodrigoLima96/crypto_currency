import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:crypto_currency/src/modules/settings/pages/editUser/widgets/update_user_button.dart';
import 'package:crypto_currency/src/modules/settings/pages/editUser/widgets/user_photo.dart';
import 'package:crypto_currency/src/modules/settings/pages/editUser/widgets/username.dart';
import 'package:flutter/material.dart';

class EditUserBody extends StatefulWidget {
  final model.User user;
  const EditUserBody({Key? key, required this.user}) : super(key: key);

  @override
  State<EditUserBody> createState() => _EditUserBodyState();
}

class _EditUserBodyState extends State<EditUserBody> {
  late final TextEditingController nameController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserPhoto(photoUrl: widget.user.photoUrl!),
            UserName(
              size: size,
              nameController: nameController,
              username: widget.user.name,
              formKey: _formKey,
            ),
            const SizedBox(height: 50),
            UpdateUserButton(
              size: size,
              name: nameController,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
