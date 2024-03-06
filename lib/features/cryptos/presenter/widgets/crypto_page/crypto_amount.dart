import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../store/store.dart';

class CryptoAmount extends StatelessWidget {
  final String symbol;
  const CryptoAmount({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartStore = Modular.get<CryptoPageStore>();

    return Observer(
      builder: (_) => chartStore.cryptoAmount > 0 ? Container(
        margin: const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green.shade500.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: (chartStore.cryptoAmount > 0)
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "${chartStore.cryptoAmount} $symbol",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green.shade300,
                  ),
                ),
              )
            : null,
      ) : const SizedBox(height: 20),
    );
  }
}
