import 'package:flutter/material.dart';

showSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
