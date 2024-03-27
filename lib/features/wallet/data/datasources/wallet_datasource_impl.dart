import '../models/models.dart';

import '../../../../core/database/local/local.dart';
import '../../domain/entities/trade_entity.dart';

import '../../domain/entities/wallet_entity.dart';

import 'datasources.dart';

class WalletDatasourceImpl implements IWalletDatasource {
  final LocalDatabaseService localDatabase;
  final WalletDatabaseHelper helper = WalletDatabaseHelper();

  WalletDatasourceImpl({required this.localDatabase});

  @override
  Future<List<WalletEntity>> getWallet() async {
    final result = await localDatabase.getWallet();
    final List<WalletEntity> wallet = WalletModel.toList(result);
    return wallet;
  }

  @override
  Future<void> tradeCrypto({required TradeEntity tradeEntity}) async {
    final userWallet = await localDatabase.getWallet();
    final double currentCryptoAmount =
        helper.cryptoExists(wallet: userWallet, cryptoId: tradeEntity.cryptoId);

    final bool cryptoExists = currentCryptoAmount > 0;

    tradeEntity.cryptoAmount += currentCryptoAmount;

    final userAccount = await localDatabase.getAccountData();
    final double userBalance =
        userAccount[0]['balance'] - tradeEntity.purchaseValue;

    return await localDatabase.tradeCrypto(
      tradeEntity: tradeEntity,
      cryptoExists: cryptoExists,
      newUserBalance: userBalance,
    );
  }
}
