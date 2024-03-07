import 'package:equatable/equatable.dart';

import '../../../cryptos/domain/entities/entities.dart';

class WalletEntity extends Equatable {
  final CryptoEntity cryptoEntity;
  final double amount;

  const WalletEntity({required this.cryptoEntity, required this.amount});

  @override
  List<Object?> get props => [cryptoEntity, amount];
}