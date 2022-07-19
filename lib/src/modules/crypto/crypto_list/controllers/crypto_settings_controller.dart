import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CryptoSettingsController extends ChangeNotifier {
  late Box box;
  Map<String, String> locale = {
    'locale': 'pt_BR',
    'name': 'R\$',
  };

  CryptoSettingsController() {
    _startSettings();
  }

  _startSettings() async {
    await _startHive();
    await _readLocale();
  }

  _startHive() async {
    box = await Hive.openBox('configs');
  }

  _readLocale() async {
    final local = box.get('local') ?? 'pt_BR';
    final name = box.get('name') ?? 'R\$';

    locale = {
      'locale': local,
      'name': name,
    };

    notifyListeners();
  }

  setLocale(String locale, String name) async {
    await box.put('local', locale);
    await box.put('name', name);
    await _readLocale();
  }
}
