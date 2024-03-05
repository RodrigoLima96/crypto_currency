class CryptoEndpoint {
  static Uri getCryptos({required String baseCurrency}) {
    return Uri.https('api.coinbase.com', '/v2/assets/search', {
      'base': baseCurrency,
    });
  }

  static Uri getCryptoPrices({
    required String cryptoId,
    required String baseCurrency,
  }) {
    return Uri.https('api.coinbase.com', '/v2/assets/prices/$cryptoId', {
      'base': baseCurrency,
    });
  }
}
