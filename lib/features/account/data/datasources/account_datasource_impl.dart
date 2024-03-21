import '../models/models.dart';

import '../../../database/local/local.dart';
import 'datasources.dart';

class AccountDatasourceImpl implements IAccountDatasource {
  final LocalDatabaseService localDatabase;

  const AccountDatasourceImpl({required this.localDatabase});

  @override
  Future<double> getUserBalance() async {
    final result = await localDatabase.getAccountData();
    return AccountModel.getUserBalance(result);
  }
}
