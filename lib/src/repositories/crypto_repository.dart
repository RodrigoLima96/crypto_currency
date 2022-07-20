import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/services/sqLite/sqlite_service.dart';

class CryptoRepository {
  final SqLiteService _sqLiteService;
  List<Crypto> _allCryptos = [];

  CryptoRepository(this._sqLiteService);

  insertCryptos() async {
    if (await _sqLiteService.checkTableEmpty()) {}
  }
}
