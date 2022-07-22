import 'package:flutter/material.dart';

class BuyCryptoBody extends StatelessWidget {
  const BuyCryptoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: size.height * 0.1),
    );
  }
}
