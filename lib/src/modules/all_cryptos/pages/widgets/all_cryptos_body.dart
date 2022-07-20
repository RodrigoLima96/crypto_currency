import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/widgets/crypto_currencies_list.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCryptosBody extends StatelessWidget {
  const AllCryptosBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AllCryptoController>();
    return RefreshIndicator(
      onRefresh: () async {
        await controller.refreshPrices();
        showSnackBar(context, 'prices updated successfully');
      },
      child: const CryptoCurrenciesList(),
    );
  }
}
