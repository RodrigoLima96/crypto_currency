import 'package:crypto_currency/features/cryptos/presenter/widgets/crypto_page/crypto_page.dart';

import '../../../domain/entities/entities.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class CryptoPageBody extends StatelessWidget {
  final CryptoEntity cryptoEntity;

  const CryptoPageBody({super.key, required this.cryptoEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          PriceAndImage(
            cryptoPrice: cryptoEntity.price,
            image: cryptoEntity.icon,
          ),
        ],
      ),
    );
  }
}
