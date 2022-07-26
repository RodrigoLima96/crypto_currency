import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/repositories/crypto_repository.dart';
import 'package:crypto_currency/src/services/auth/auth_service.dart';
import 'package:crypto_currency/src/services/firestore/firestore_service.dart';
import 'package:flutter/cupertino.dart';

class AllCryptoController extends ChangeNotifier {
  List<Crypto> cryptos = [];
  List<Crypto> favCryptos = [];
  List<Crypto> selected = [];

  final CryptoRepository _cryptoRepository;
  final FirestoreService _firestoreService;
  final AuthService _authService;

  AllCryptoController(
    this._cryptoRepository,
    this._firestoreService,
    this._authService,
  ) {
    getAllCryptos();
    getFavCryptos();
  }

  getAllCryptos() async {
    cryptos = await _cryptoRepository.readCryptosTable();
    notifyListeners();
  }

  refreshPrices() async {
    await _cryptoRepository.refreshPrices(cryptos);
    await getAllCryptos();

    List<Crypto> updateFavs = [];
    for (var crypto in favCryptos) {
      if (cryptos.any((element) => element.symbol == crypto.symbol)) {
        Crypto newCrypto =
            cryptos.firstWhere((element) => element.symbol == crypto.symbol);
        updateFavs.add(newCrypto);
      }
    }
    final String uid = await _authService.getUserUid();

    await _firestoreService.updateFavCryptos(updateFavs, uid);
    await getFavCryptos();
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

  cleanSelected() {
    selected = [];
    notifyListeners();
  }

  saveFavCryptos() async {
    final String uid = await _authService.getUserUid();

    await _firestoreService.saveFavCryptos(selected, uid);

    cleanSelected();
    await getFavCryptos();
  }

  getFavCryptos() async {
    final String uid = await _authService.getUserUid();

    favCryptos = await _firestoreService.getFavCryptos(uid);
    notifyListeners();
  }

  removeFavCrypto(Crypto crypto) async {
    final String uid = await _authService.getUserUid();
    await _firestoreService.removeFavCrypto(crypto, uid);
    favCryptos.remove(crypto);
    notifyListeners();
  }
}
