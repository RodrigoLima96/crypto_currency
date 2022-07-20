import 'package:crypto_currency/src/modules/all_cryptos/pages/widgets/crypto_currencies_list.dart';
import 'package:flutter/material.dart';

class AllCryptosBody extends StatelessWidget {
  const AllCryptosBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: const CryptoCurrenciesList(),
    );
  }
}
