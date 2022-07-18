import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:crypto_currency/src/shared/widgets/moeda_carteira_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarteiraPage extends StatefulWidget {
  const CarteiraPage({Key? key}) : super(key: key);

  @override
  _CarteiraPageState createState() => _CarteiraPageState();
}

class _CarteiraPageState extends State<CarteiraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteira'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Consumer<ContaRepository>(
            builder: (context, lista, child) {
              return lista.carteira.isEmpty
                  ? const ListTile(
                      leading: Icon(Icons.account_balance_wallet_outlined),
                      title: Text('Sem moedas na sua carteira'),
                    )
                  : ListView.builder(
                      itemCount: lista.carteira.length,
                      itemBuilder: (_, moeda) {
                        return MoedaCarteiraCard(
                            carteira: lista.carteira[moeda]);
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
