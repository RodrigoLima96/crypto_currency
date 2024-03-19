import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../store/store.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    final walletStore = Modular.get<WalletStore>();

    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () async {
          await walletStore.getWallet();
        },
        child: const Text('TESTE'),
      ),
    ));
  }
}
