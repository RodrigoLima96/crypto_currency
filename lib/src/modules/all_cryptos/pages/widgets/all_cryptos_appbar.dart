import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class AllCryptosAppBar extends AppBar {
  AllCryptosAppBar({Key? key})
      : super(
          key: key,
          backgroundColor: blackColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/more2.png',
              color: Colors.white,
              width: 20,
            ),
          ),
        );
}
