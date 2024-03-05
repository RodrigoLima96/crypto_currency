import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/utils/utils.dart';
import '../../store/store.dart';
import 'crypto_tile.dart';
import 'list_divider.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({super.key});

  @override
  State<CryptoList> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  final cryptoStore = Modular.get<CryptoListStore>();

  @override
  void initState() {
    super.initState();
    cryptoStore.getCryptos();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        color: backgroundColor,
        child: ListView.separated(
          separatorBuilder: (_, __) => const ListDivider(),
          itemCount: cryptoStore.cryptosList.length,
          itemBuilder: (context, index) {
            final crypto = cryptoStore.cryptosList[index];
            return CryptoTile(crypto: crypto);
          },
        ),
      ),
    );
  }
}