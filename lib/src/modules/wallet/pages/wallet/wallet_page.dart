import 'package:crypto_currency/src/modules/wallet/controllers/wallet_controller.dart';
import 'package:crypto_currency/src/modules/wallet/pages/wallet/widgets/crypto_wallet_card.dart';
import 'package:crypto_currency/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WalletController>().getWallet();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        centerTitle: true,
        backgroundColor: blackColor,
      ),
      body: Consumer<WalletController>(
        builder: (context, wallet, child) {
          return wallet.wallet.isEmpty
              ? const ListTile(
                  leading: Icon(Icons.account_balance_wallet_outlined),
                  title: Text('No coins in your wallet yet'),
                )
              : ListView.builder(
                  itemCount: wallet.wallet.length,
                  itemBuilder: (_, crypto) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CryptoWalletCard(wallet: wallet.wallet[crypto]),
                    );
                  },
                );
        },
      ),
    );
  }
}
