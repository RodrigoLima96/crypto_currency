import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/modules/favorites/pages/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllCryptoController>(
      builder: (context, favorites, child) {
        return favorites.favCryptos.isEmpty
            ? const ListTile(
                leading: Icon(Icons.star),
                title: Text("No favorite cryptos yet"),
              )
            : ListView.builder(
                itemCount: favorites.favCryptos.length,
                itemBuilder: (_, crypto) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CryptoCard(crypto: favorites.favCryptos[crypto]),
                  );
                },
              );
      },
    );
  }
}
