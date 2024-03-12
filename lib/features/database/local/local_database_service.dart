import 'local.dart';

class LocalDatabaseService {
  final InitDatabaseService localDatabaseService;

  LocalDatabaseService({required this.localDatabaseService});

  getWallet() async {
    final result = await localDatabaseService.database.query();
    print(result);
  }
}