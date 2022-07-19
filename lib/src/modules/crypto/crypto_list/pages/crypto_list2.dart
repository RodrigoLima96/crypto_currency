import 'package:crypto_currency/pages/transacoes/compra_detalhe_page.dart';
import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_controller.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CryptoListPage2 extends StatefulWidget {
  const CryptoListPage2({Key? key}) : super(key: key);

  @override
  _CryptoListPage2State createState() => _CryptoListPage2State();
}

class _CryptoListPage2State extends State<CryptoListPage2> {
  late List<Crypto> tabela;
  late NumberFormat real;
  late Map<String, String> loc;
  List<Crypto> selecionadas = [];
  late MoedasRepository moedas;
  late FavoritasRepository favoritas;

  changeLanguageButton() {
    final locale = loc['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = loc['locale'] == 'pt_BR' ? '\$' : 'R\$';

    return PopupMenuButton(
      icon: const Icon(Icons.language_outlined),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.swap_vert),
            title: Text('Usar $locale'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }

  mostrarDetalhe(Crypto moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CompraPage(moeda: moeda)),
    );
  }

  atualizaPrecos() async {
    await moedas.checkPrices();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Preços atualizados com sucesso")),
    );
  }

  limparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text('Crypto Moedas'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          changeLanguageButton(),
        ],
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () => limparSelecionadas(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: (selecionadas.length > 1)
            ? Text('${selecionadas.length} selecionadas')
            : Text("${selecionadas.length} selecionada"),
        centerTitle: true,
        backgroundColor: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    moedas = context.watch<MoedasRepository>();
    favoritas = context.watch<FavoritasRepository>();
    tabela = moedas.table;
    return Scaffold(
      appBar: appBarDinamica(),
      body: RefreshIndicator(
        onRefresh: () => atualizaPrecos(),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              leading: SizedBox(
                child: Image.network(tabela[i].icon),
                width: 40,
              ),
              title: Row(
                children: [
                  Text(
                    tabela[i].name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (favoritas.lista
                      .any((moeda) => moeda.symbol == tabela[i].symbol))
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
              trailing: Text(real.format(tabela[i].price)),
              selected: selecionadas.contains(tabela[i]),
              selectedTileColor: Colors.black,
              onLongPress: () {
                setState(() {
                  (selecionadas.contains(tabela[i])
                      ? selecionadas.remove(tabela[i])
                      : selecionadas.add(tabela[i]));
                });
              },
              onTap: () => mostrarDetalhe(tabela[i]),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length,
          padding: const EdgeInsets.all(20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                favoritas.saveAll(selecionadas);
                limparSelecionadas();
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
          : null,
    );
  }
}
