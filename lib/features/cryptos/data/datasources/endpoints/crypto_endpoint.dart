class CryptoEndpoint {
  static Uri getCryptos({required String baseCurrency}) {
    return Uri.https('api.coinbase.com', '/v2/assets/search', {
      'base': baseCurrency,
    });
  }
}