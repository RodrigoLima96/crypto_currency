import 'package:crypto_currency/src/app_widget.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startHive();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
