import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

NumberFormat price = NumberFormat.currency(locale: 'en_US', name: '\$');
