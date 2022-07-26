import 'package:flutter/cupertino.dart';

import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';

class FavController extends ChangeNotifier {
  List<Crypto> cryptos = [];
  List<Crypto> favCryptos = [];

  final CryptoRepository _cryptoRepository;
  FavController(
    this._cryptoRepository,
  ) {
    getAllCryptos();
  }

  getAllCryptos() async {
    cryptos = await _cryptoRepository.readCryptosTable();
    notifyListeners();
  }

  checkFavCryptos() {}
}
