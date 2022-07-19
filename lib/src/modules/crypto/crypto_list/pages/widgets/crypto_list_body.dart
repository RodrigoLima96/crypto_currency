import 'package:flutter/material.dart';

class CryptoListBody extends StatelessWidget {
  const CryptoListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
    );
  }
}
