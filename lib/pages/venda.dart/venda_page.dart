import 'package:crypto_currency/pages/widgets/moeda_venda_card.dart';
import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendaPage extends StatefulWidget {
  const VendaPage({Key? key}) : super(key: key);

  @override
  _VendaPageState createState() => _VendaPageState();
}

class _VendaPageState extends State<VendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Consumer<ContaRepository>(builder: (context, lista, child) {
              return lista.carteira.isEmpty
                  ? const ListTile(
                      leading: Icon(Icons.wallet_giftcard),
                      title: Text('Sem moedas na sua carteira'),
                    )
                  : ListView.builder(
                      itemCount: lista.carteira.length,
                      itemBuilder: (_, moeda) {
                        return MoedaCardVenda(moeda: lista.carteira[moeda]);
                      });
            })),
      ),
    );
  }
}
