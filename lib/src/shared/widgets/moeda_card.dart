import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/pages/transacoes/compra_detalhe_page.dart';
import 'package:crypto_currency/repositories/favoritas_repository.dart';
import 'package:crypto_currency/src/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedaCard extends StatefulWidget {
  final Moeda moeda;
  const MoedaCard({Key? key, required this.moeda}) : super(key: key);

  @override
  _MoedaCardState createState() => _MoedaCardState();
}

class _MoedaCardState extends State<MoedaCard> {
  late NumberFormat real;

  transacoes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CompraPage(moeda: widget.moeda),
      ),
    );
  }

  readNumberFormat() {
    final loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  @override
  Widget build(BuildContext context) {
    readNumberFormat();
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 20,
      child: InkWell(
        onTap: () => transacoes(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.network(
                widget.moeda.icone,
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.moeda.nome,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(widget.moeda.sigla,
                          style: const TextStyle(
                            fontSize: 13,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.05),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  real.format(widget.moeda.preco),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: -1,
                  ),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                color: Colors.black,
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: ListTile(
                    title: const Text("Remover das favoritas"),
                    onTap: () {
                      Navigator.pop(context);
                      Provider.of<FavoritasRepository>(context, listen: false)
                          .remove(widget.moeda);
                    },
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
