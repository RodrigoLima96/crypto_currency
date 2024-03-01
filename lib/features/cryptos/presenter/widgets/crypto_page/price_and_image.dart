import 'package:crypto_currency/core/utils/utils.dart';
import 'package:flutter/material.dart';

class PriceAndImage extends StatelessWidget {
  final String image;
  final double cryptoPrice;

  const PriceAndImage({
    Key? key,
    required this.image,
    required this.cryptoPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          image,
          width: 50,
        ),
        const SizedBox(width: 40),
        Text(
          price.format(cryptoPrice),
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: whiteColor,
            letterSpacing: -1,
          ),
        )
      ],
    );
  }
}
