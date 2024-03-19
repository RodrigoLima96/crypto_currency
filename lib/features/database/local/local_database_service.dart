import 'local.dart';

class LocalDatabaseService {
  final InitDatabaseService localDatabaseService;

  LocalDatabaseService({required this.localDatabaseService});

  getWallet() async {
    final db = await localDatabaseService.database;
    final result = await db.query('wallet');
    print(result[0]);
    print(result[0]);
  }
}
