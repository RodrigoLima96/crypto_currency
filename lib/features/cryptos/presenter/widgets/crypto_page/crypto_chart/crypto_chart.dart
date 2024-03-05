import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../store/store.dart';
import 'chart_buttons_widget.dart';

class CryptoChart extends StatefulWidget {
  final String cryptoId;

  const CryptoChart({super.key, required this.cryptoId});

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  final cryptoPageStore = Modular.get<CryptoPageStore>();

  @override
  void initState() {
    super.initState();
    cryptoPageStore.getCryptoPrices(cryptoId: widget.cryptoId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(children: [
          const ChartButtonsWidget(),
          Observer(builder: (_) => Container())
        ]),
      ),
    );
  }
}
