import '../../../database/local/local.dart';
import '../../domain/entities/trade_entity.dart';

import '../../domain/entities/wallet_entity.dart';

import 'datasources.dart';

class WalletDatasourceImpl implements IWalletDatasource {
  final LocalDatabaseService localDatabase;

  const WalletDatasourceImpl({required this.localDatabase});

  @override
  Future<List<WalletEntity>> getWallet() async {
    final result = await localDatabase.getWallet();
    print(result);
    throw UnimplementedError();
  }

  @override
  Future<void> tradeCrypto({required TradeEntity tradeEntity}) {
    throw UnimplementedError();
  }
}