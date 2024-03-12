import '../../domain/entities/entities.dart';

abstract class IWalletDatasource {
  Future<List<WalletEntity>> getWallet();

  Future<void> tradeCrypto({
    required TradeEntity tradeEntity,
  });
}