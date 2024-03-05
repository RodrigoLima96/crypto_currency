import 'package:http/http.dart' as http;

import '../../../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'crypto_datasource.dart';
import 'endpoints/endpoints.dart';

class CryptoDatasourceImpl implements ICryptoDatasource {
  final http.Client client;

  const CryptoDatasourceImpl({required this.client});

  @override
  Future<List<CryptoEntity>> getCryptos() async {
    final response =
        await client.get(CryptoEndpoint.getCryptos(baseCurrency: 'USD'));

    if (response.statusCode == 200) {
      List<CryptoModel> cryptoList = CryptoModel.toList(response.body);
      return cryptoList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCryptoPrices(
      {required String cryptoId}) async {
    final response = await client.get(CryptoEndpoint.getCryptoPrices(
      cryptoId: cryptoId,
      baseCurrency: 'USD',
    ));

    if (response.statusCode == 200) {
      return CryptoModel.getCryptoPrices(data: response.body);
    } else {
      throw ServerException();
    }
  }
}
