// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TradeEntity extends Equatable {
  final String cryptoId;
  double cryptoAmount;
  final double purchaseValue;
  final bool buyTransaction;

  TradeEntity({
    required this.cryptoId,
    required this.cryptoAmount,
    required this.purchaseValue,
    required this.buyTransaction,
  });

  @override
  List<Object?> get props => [];
}
