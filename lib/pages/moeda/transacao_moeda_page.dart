import 'package:crypto_currency/models/moeda.dart';
import 'package:crypto_currency/pages/moeda/moeda_detalhe.dart';
import 'package:crypto_currency/pages/venda.dart/venda_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransacaoPage extends StatefulWidget {
  final Moeda moeda;
  const TransacaoPage({Key? key, required this.moeda}) : super(key: key);

  @override
  _TransacaoPageState createState() => _TransacaoPageState();
}

class _TransacaoPageState extends State<TransacaoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MoedaDetalhe(moeda: widget.moeda),
                ),
              );
            },
            child: SizedBox(
              height: size.height,
              width: size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Comprar',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Lottie.asset(
                      'assets/animations/arrow.json',
                      height: size.height * 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const VendaPage()));
            },
            child: SizedBox(
              height: size.height,
              width: size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Vender',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Lottie.asset(
                      'assets/animations/arrow.json',
                      height: size.height * 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
