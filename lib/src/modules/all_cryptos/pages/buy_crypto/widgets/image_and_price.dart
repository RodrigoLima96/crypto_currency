import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';

class ImageAndPrice extends StatelessWidget {
  final String image;
  final double cryptoPrice;

  const ImageAndPrice({
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
        Container(
          width: 40,
        ),
        Text(
          price.format(cryptoPrice),
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        )
      ],
    );
  }
}
