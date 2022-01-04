import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/models/moeda.dart';
import 'package:crypto_currency/pages/moeda/moeda_detalhe.dart';
import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedasRepository.tabela;
  late NumberFormat real;
  late Map<String, String> loc;
  List<Moeda> selecionadas = [];
  late FavoritasRepository favoritas;

  readNumberFormat() {
    loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

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
              context.read<AppSettings>().setLocale(locale, name);
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }

  mostrarDetalhe(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MoedaDetalhe(moeda: moeda)),
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
    readNumberFormat();
    favoritas = context.watch<FavoritasRepository>();
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            leading: SizedBox(
              child: Image.asset(tabela[i].icone),
              width: 40,
            ),
            title: Row(
              children: [
                Text(
                  tabela[i].nome,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (favoritas.lista
                    .any((moeda) => moeda.sigla == tabela[i].sigla))
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                  )
              ],
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
