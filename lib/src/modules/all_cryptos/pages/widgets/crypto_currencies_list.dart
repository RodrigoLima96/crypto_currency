import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoCurrenciesList extends StatelessWidget {
  const CryptoCurrenciesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AllCryptoController>();

    return ListView.separated(
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          leading: SizedBox(
            child: Image.network(controller.cryptos[i].icon),
            width: 40,
          ),
          title: Row(
            children: [
              Text(
                controller.cryptos[i].name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (controller.favCryptos.any((favCrypto) =>
                  favCrypto.symbol == controller.cryptos[i].symbol))
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                ),
            ],
          ),
          trailing: Text(price.format(controller.cryptos[i].price)),
          selected: controller.selected.contains(controller.cryptos[i]),
          selectedTileColor: Colors.black,
          onLongPress: () {
            // setState(() {
            //   (selecionadas.contains(tabela[i])
            //       ? selecionadas.remove(tabela[i])
            //       : selecionadas.add(tabela[i]));
            // });
          },
          onTap: () => {},
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: controller.cryptos.length,
    );
  }
}
