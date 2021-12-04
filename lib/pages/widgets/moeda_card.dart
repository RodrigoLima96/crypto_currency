import 'package:crypto_currency/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedaCard extends StatefulWidget {
  final Moeda moeda;
  const MoedaCard({Key? key, required this.moeda}) : super(key: key);

  @override
  _MoedaCardState createState() => _MoedaCardState();
}

class _MoedaCardState extends State<MoedaCard> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 20,
      child: InkWell(
        onTap: () {},
        child: Row(),
      ),
    );
  }
}
