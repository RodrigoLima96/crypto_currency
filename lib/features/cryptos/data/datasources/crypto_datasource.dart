import '../../domain/entities/entities.dart';

abstract class ICryptoDatasource {
  Future<List<CryptoEntity>> getCryptos();

  Future<List<Map<String, dynamic>>> getCryptoPrices({required String cryptoId});
}
