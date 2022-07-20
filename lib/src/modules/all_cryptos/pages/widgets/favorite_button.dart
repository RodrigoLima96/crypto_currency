import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // favoritas.saveAll(selecionadas);
        // limparSelecionadas();
      },
      shape:
          const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
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
    );
  }
}
