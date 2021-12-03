import 'package:crypto_currency/models/moeda.dart';
import 'package:crypto_currency/pages/moeda/moeda_detalhe.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabela = MoedasRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionadas = [];

  mostrarDetalhe(Moeda moeda) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MoedaDetalhe(moeda: moeda)));
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
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            leading: SizedBox(
              child: Image.asset(tabela[i].icone),
              width: 40,
            ),
            title: Text(
              tabela[i].nome,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(real.format(tabela[i].preco)),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => limparSelecionadas(),
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
              ))
          : null,
    );
  }
}
