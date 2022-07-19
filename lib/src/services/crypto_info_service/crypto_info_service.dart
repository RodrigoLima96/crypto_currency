import 'dart:convert';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:http/http.dart' as http;

class CryptoInfoService {
  getCryptoHistory(Crypto crypto) async {
    final response = await http.get(
      Uri.parse(
        'https://api.coinbase.com/v2/assets/prices/${crypto.baseId}?base=USD',
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Map<String, dynamic> priceList = json['data']['prices'];

      return priceList;
    }
  }

  checkPrices() async {
    String uri = 'https://api.coinbase.com/v2/assets/search?base=USD';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> cryptoList = json['data'];
      return cryptoList;
    }
  }

  getCryptoList() async {
    String uri = 'https://api.coinbase.com/v2/assets/search?base=USD';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> cryptoList = json['data'];
      return cryptoList;
    }
  }
}
