import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos/widgets/all_cryptos_appbar.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos/widgets/all_cryptos_body.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/all_cryptos/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class AllCryptosPage extends StatelessWidget {
  const AllCryptosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AllCryptosAppBar(),
      body: AllCryptosBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FavoriteButton(),
    );
  }
}
