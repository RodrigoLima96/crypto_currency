import 'package:flutter/material.dart';

import 'chart_buttons_widget.dart';
import 'crypto_line_chart.dart';

class CryptoChart extends StatelessWidget {
  final String cryptoId;

  const CryptoChart({super.key, required this.cryptoId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(children: [
          const ChartButtonsWidget(),
          CryptoLineChart(cryptoId: cryptoId),
        ]),
      ),
    );
  }
}
