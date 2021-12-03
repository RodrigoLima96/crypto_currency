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

  mostrarDetalhe(Moeda moeda) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MoedaDetalhe(moeda: moeda)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Moedas'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
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
            onTap: () => mostrarDetalhe(tabela[i]),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
      ),
    );
  }
}
