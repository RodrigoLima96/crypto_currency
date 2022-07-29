import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final Size size;
  final TextEditingController nameController;
  final String username;
  final GlobalKey<FormState> formKey;

  const UserName({
    Key? key,
    required this.size,
    required this.nameController,
    required this.username,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'name',
          ),
          validator: (value) => null,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
