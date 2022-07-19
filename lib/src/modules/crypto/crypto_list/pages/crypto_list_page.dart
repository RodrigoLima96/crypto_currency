import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_list_controller.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/pages/widgets/crypto_list_body.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/pages/widgets/cryto_list_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoListPage extends StatelessWidget {
  const CryptoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CryptoListController>();

    return Scaffold(
      appBar: appBarDinamica(
          selected: controller.selected,
          cleanSelected: () {
            controller.cleanSelected();
          }),
      body: const CryptoListBody(),
    );
  }
}
