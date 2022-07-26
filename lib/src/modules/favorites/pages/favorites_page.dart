import 'package:crypto_currency/src/modules/favorites/pages/widgets/favorites_body.dart';
import 'package:crypto_currency/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Cryptos'),
        centerTitle: true,
        backgroundColor: blackColor,
      ),
      body: const FavoritesBody(),
    );
  }
}
