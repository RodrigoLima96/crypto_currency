import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AllCryptoController>();

    return controller.selected.isNotEmpty
        ? FloatingActionButton.extended(
            onPressed: () {
              // favoritas.saveAll(selecionadas);
              // limparSelecionadas();
            },
            shape: const StadiumBorder(
                side: BorderSide(color: Colors.white, width: 2)),
            backgroundColor: Colors.black,
            icon: const Icon(
              Icons.star,
              color: Colors.white,
            ),
            label: const Text(
              "Favoritar",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 0,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : const SizedBox();
  }
}
