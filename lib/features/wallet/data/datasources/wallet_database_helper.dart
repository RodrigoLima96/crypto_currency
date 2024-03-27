class WalletDatabaseHelper {
  double cryptoExists({required List<dynamic> wallet, required String cryptoId}) {
    for (var crypto in wallet) {
      if (crypto['cryptoId'] == cryptoId) {
        return crypto['amount'];
      }
    }
    return 0.0;
  }
}
