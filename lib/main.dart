import 'package:crypto_currency/configs/hive_config.dart';
import 'package:crypto_currency/src/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
