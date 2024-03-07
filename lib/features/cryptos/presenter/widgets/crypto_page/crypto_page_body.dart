import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/entities.dart';
import '../widgets.dart';

class CryptoPageBody extends StatelessWidget {
  final CryptoEntity cryptoEntity;

  const CryptoPageBody({super.key, required this.cryptoEntity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.only(top: 30),
        height: 1000,
        child: Column(
          children: [
            PriceAndImage(
              cryptoPrice: cryptoEntity.price,
              image: cryptoEntity.icon,
            ),
            CryptoChart(cryptoId: cryptoEntity.id),
            CryptoAmount(symbol: cryptoEntity.symbol),
            BuyCryptoInputText(cryptoPrice: cryptoEntity.price),
            BuyCryptoButton(
                cryptoEntity: cryptoEntity, purchaseTransaction: true),
          ],
        ),
      ),
    );
  }
}
