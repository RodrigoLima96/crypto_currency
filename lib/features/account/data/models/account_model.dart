import '../../domain/entities/entities.dart';

class AccountModel extends AccountEntity {
  const AccountModel({
    required super.name,
    required super.image,
    required super.balance,
  });

  static double getUserBalance(List<dynamic> account) {
    return account[0]['balance'];
  }
}
