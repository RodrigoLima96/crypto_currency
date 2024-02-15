import '../../domain/entities/entities.dart';

abstract class ICryptoDatasource {
  Future<List<CryptoEntity>> getCryptos();
}