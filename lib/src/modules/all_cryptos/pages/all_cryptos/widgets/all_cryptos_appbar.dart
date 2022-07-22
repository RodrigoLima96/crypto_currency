import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCryptosAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AllCryptosAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AllCryptoController>();

    return controller.selected.isEmpty
        ? AppBar(
            title: const Text('Crypto Currencies'),
            centerTitle: true,
            backgroundColor: blackColor,
          )
        : AppBar(
            leading: IconButton(
              onPressed: () => controller.cleanSelected(),
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text('${controller.selected.length} selected'),
            centerTitle: true,
            backgroundColor: Colors.black,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
