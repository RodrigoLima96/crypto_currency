import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/widgets/all_cryptos_body.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/widgets/favorite_button.dart';
import 'package:crypto_currency/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class AllCryptosPage extends StatelessWidget {
  const AllCryptosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Crypto> selectd = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies'),
        centerTitle: true,
        backgroundColor: blackColor,
      ),
      body: const AllCryptosBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectd.isNotEmpty ? const FavoriteButton() : null,
    );
  }
}
