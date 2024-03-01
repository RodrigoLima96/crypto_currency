import 'package:flutter/material.dart';

import 'chart_buttons_widget.dart';

class CryptoChart extends StatelessWidget {
  const CryptoChart({super.key});

  @override
  Widget build(BuildContext context) {

    return const SizedBox(
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(children: [
          ChartButtonsWidget(),
        ]),
      ),
    );
  }
}