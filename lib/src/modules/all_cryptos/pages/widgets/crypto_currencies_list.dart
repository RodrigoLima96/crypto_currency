import 'package:crypto_currency/src/models/crypto.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesList extends StatelessWidget {
  const CryptoCurrenciesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Crypto> crypto = [
      Crypto(
        baseId: '123',
        icon: 'https://bitcoin.org/img/icons/opengraph.png?1657703267',
        name: 'BITCOIN',
        symbol: 'BTC',
        price: 38.234,
        timeStamp: DateTime.now(),
        changeHour: 38.234,
        changeDay: 38.234,
        changeWeek: 38.234,
        changeMonth: 38.234,
        changeYear: 38.234,
        changeAllTime: 38.234,
      ),
      Crypto(
        baseId: '123',
        icon: 'https://bitcoin.org/img/icons/opengraph.png?1657703267',
        name: 'BITCOIN',
        symbol: 'BTCC',
        price: 38.234,
        timeStamp: DateTime.now(),
        changeHour: 38.234,
        changeDay: 38.234,
        changeWeek: 38.234,
        changeMonth: 38.234,
        changeYear: 38.234,
        changeAllTime: 38.234,
      )
    ];
    List<Crypto> favCryptos = [
      Crypto(
        baseId: '123',
        icon: 'https://bitcoin.org/img/icons/opengraph.png?1657703267',
        name: 'BITCOIN',
        symbol: 'BTC',
        price: 38.234,
        timeStamp: DateTime.now(),
        changeHour: 38.234,
        changeDay: 38.234,
        changeWeek: 38.234,
        changeMonth: 38.234,
        changeYear: 38.234,
        changeAllTime: 38.234,
      ),
    ];

    List<Crypto> selected = [];
    return ListView.separated(
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          leading: SizedBox(
            child: Image.network(crypto[i].icon),
            width: 40,
          ),
          title: Row(
            children: [
              Text(
                crypto[i].name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (favCryptos
                  .any((favCrypto) => favCrypto.symbol == crypto[i].symbol))
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
          trailing: Text(crypto[i].price.toString()),
          selected: selected.contains(crypto[i]),
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
      itemCount: crypto.length,
    );
  }
}
