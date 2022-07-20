import 'dart:async';

import 'package:crypto_currency/src/models/crypto.dart';
import 'package:flutter/cupertino.dart';

class AllCryptosController extends ChangeNotifier {
  List<Crypto> _table = [];
  late Timer timeUpdate;
}
