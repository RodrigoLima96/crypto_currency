import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/entities.dart';
import 'package:flutter/material.dart';

class CryptoTile extends StatelessWidget {
  final CryptoEntity crypto;

  const CryptoTile({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(crypto.name,
          style:
              const TextStyle(color: whiteColor, fontWeight: FontWeight.w600)),
      subtitle: Text(crypto.symbol,
          style:
              const TextStyle(color: whiteColor, fontWeight: FontWeight.bold)),
      leading: crypto.icon != ''
          ? Image.network(crypto.icon, width: 50)
          : const SizedBox(),
      trailing: Text(price.format(crypto.price),
          style: const TextStyle(
              color: greyColor, fontWeight: FontWeight.bold, fontSize: 13)),
      onTap: () {
        Modular.to.pushNamed('/crypto', arguments: crypto);
      },
    );
  }
}