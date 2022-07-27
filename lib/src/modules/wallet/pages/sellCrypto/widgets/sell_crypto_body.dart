import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/modules/wallet/controllers/wallet_controller.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/widgets/crypto_amount.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/widgets/crypto_icon.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/widgets/sell_crypto_button.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/widgets/sell_crypto_form.dart';
import 'package:crypto_currency/src/modules/wallet/pages/sellCrypto/widgets/total_crypto_usd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellCryptoBody extends StatefulWidget {
  final Wallet wallet;

  const SellCryptoBody({Key? key, required this.wallet}) : super(key: key);

  @override
  State<SellCryptoBody> createState() => _SellCryptoBodyState();
}

class _SellCryptoBodyState extends State<SellCryptoBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<WalletController>().setAmount(widget.wallet.amount);
    });
  }

  initAmount() async {}

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    final double total = widget.wallet.amount * widget.wallet.crypto.price;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CryptoIcon(icon: widget.wallet.crypto.icon),
          const SizedBox(height: 20),
          CryptoAmount(size: size, amount: widget.wallet.amount),
          TotalCryptoUSD(total: total),
          SellCryptoForm(
            amountController: _amountController,
            formKey: _formKey,
            symbol: widget.wallet.crypto.symbol,
            cryptoPrice: widget.wallet.crypto.price,
            total: total,
            cryptoAmount: widget.wallet.amount,
          ),
          SellCryptoButton(
            formKey: _formKey,
            amountController: _amountController,
            crypto: widget.wallet.crypto,
          ),
        ],
      ),
    );
  }
}
