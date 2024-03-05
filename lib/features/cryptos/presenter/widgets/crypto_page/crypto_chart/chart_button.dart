import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../store/store.dart';

class ChartButton extends StatelessWidget {
  final Period p;
  final String label;
  const ChartButton({Key? key, required this.label, required this.p})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartStore = Modular.get<CryptoPageStore>();
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: OutlinedButton(
          onPressed: () {
            chartStore.changePeriod(p);
            chartStore.getCryptoPrices(cryptoId: chartStore.currentCryptoId);
          },
          style: (chartStore.period != p)
              ? _inactiveButtonStyle()
              : _activeButtonStyle(lineChartColors[0]),
          child: Text(label),
        ),
      ),
    );
  }
}

ButtonStyle _inactiveButtonStyle() {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
  );
}

ButtonStyle _activeButtonStyle(Color textColor) {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all(textColor),
    backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
  );
}
