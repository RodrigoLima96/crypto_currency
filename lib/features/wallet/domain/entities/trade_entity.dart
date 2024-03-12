import 'package:equatable/equatable.dart';

class TradeEntity extends Equatable {
  final String cryptoId;
  final double amount;
  final bool buyTransaction;

  const TradeEntity({
    required this.cryptoId,
    required this.amount,
    required this.buyTransaction,
  });

  @override
  List<Object?> get props => [];
}
