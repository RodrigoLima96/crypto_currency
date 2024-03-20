import 'package:equatable/equatable.dart';

class WalletEntity extends Equatable {
  final String cryptoId;
  final double amount;

  const WalletEntity({required this.cryptoId, required this.amount});

  @override
  List<Object?> get props => [cryptoId, amount];
}