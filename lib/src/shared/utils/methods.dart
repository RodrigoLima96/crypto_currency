import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

showSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

NumberFormat price = NumberFormat.currency(locale: 'en_US', name: '\$');

pickImage() async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

  if (file != null) {
    return await file.readAsBytes();
  }
}
