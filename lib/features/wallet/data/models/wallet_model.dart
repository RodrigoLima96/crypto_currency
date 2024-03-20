import '../../domain/entities/entities.dart';

class WalletModel extends WalletEntity {
  const WalletModel({required super.cryptoId, required super.amount});

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        cryptoId: json['cryptoId'],
        amount: json['amount'],
      );

  static List<WalletModel> toList(List<dynamic> walletList) {
    return walletList.map((item) => WalletModel.fromJson(item)).toList();
  }
}