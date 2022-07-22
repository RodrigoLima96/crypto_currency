import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoInfoService {
  getCryptoPrices(String cryptoId) async {
    final response = await http.get(
      Uri.parse(
        'https://api.coinbase.com/v2/assets/prices/$cryptoId?base=USD',
      ),
    );

    List<Map<String, dynamic>> prices = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Map<String, dynamic> crypto = json['data']['prices'];

      prices.add(crypto['hour']);
      prices.add(crypto['day']);
      prices.add(crypto['week']);
      prices.add(crypto['month']);
      prices.add(crypto['year']);
      prices.add(crypto['all']);

      return prices;
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
