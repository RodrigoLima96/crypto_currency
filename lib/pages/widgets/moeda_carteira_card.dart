import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/models/posicao.dart';
import 'package:crypto_currency/pages/transacoes/venda_detalhe_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedaCarteiraCard extends StatefulWidget {
  final Posicao carteira;
  const MoedaCarteiraCard({Key? key, required this.carteira}) : super(key: key);

  @override
  _MoedaCarteiraCardState createState() => _MoedaCarteiraCardState();
}

class _MoedaCarteiraCardState extends State<MoedaCarteiraCard> {
  late NumberFormat real;

  readNumberFormat() {
    final loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  @override
  Widget build(BuildContext context) {
    double total = widget.carteira.moeda.preco * widget.carteira.quantidade;

    readNumberFormat();
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 20,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendaPage(moeda: widget.carteira),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.network(
                widget.carteira.moeda.icone,
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.carteira.moeda.nome,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.carteira.quantidade.toStringAsFixed(3),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.05),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    real.format(total),
                    style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
