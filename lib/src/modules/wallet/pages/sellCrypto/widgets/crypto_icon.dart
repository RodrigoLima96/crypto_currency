import 'package:flutter/material.dart';

class CryptoIcon extends StatelessWidget {
  const CryptoIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        icon,
        height: 60,
      ),
    );
  }
}
