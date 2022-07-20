import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';
import 'package:flutter/cupertino.dart';

class AllCryptoController extends ChangeNotifier {
  List<Crypto> cryptos = [];
  List<Crypto> favCryptos = [];
  List<Crypto> selected = [];

  final CryptoRepository _cryptoRepository;

  AllCryptoController(this._cryptoRepository) {
    getAllCryptos();
  }

  getAllCryptos() async {
    cryptos = await _cryptoRepository.readCryptosTable();
    notifyListeners();
  }

  refreshPrices() async {
    await _cryptoRepository.refreshPrices(cryptos);
    await getAllCryptos();
    notifyListeners();
  }

  selectCryptos(Crypto crypto) {
    if (!selected.contains(crypto)) {
      selected.add(crypto);
      notifyListeners();
    } else {
      selected.remove(crypto);
      notifyListeners();
    }
  }
}
