import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoListController extends ChangeNotifier {
  late List<Crypto> cryptoList;
  late NumberFormat real;
  late Map<String, String> loc;
  List<Crypto> selected = [];
  late MoedasRepository crypto;
  late FavoritasRepository fav;
  final CryptoSettingsController _cryptoSettingsController;

  CryptoListController(this._cryptoSettingsController) {
    readNumberFormat();
  }

  readNumberFormat() {
    loc = _cryptoSettingsController.locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  changeLanguageButton() {
    final locale = loc['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = loc['locale'] == 'pt_BR' ? '\$' : 'R\$';

    return PopupMenuButton(
      icon: const Icon(Icons.language_outlined),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.swap_vert),
            title: Text('Usar $locale'),
            onTap: () {
              _cryptoSettingsController.setLocale(locale, name);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  cleanSelected() {
    selected = [];
    notifyListeners();
  }
}
