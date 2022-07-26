import 'package:crypto_currency/src/models/wallet.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';

class CryptoWalletCard extends StatefulWidget {
  final Wallet wallet;
  const CryptoWalletCard({Key? key, required this.wallet}) : super(key: key);

  @override
  _CryptoWalletCardState createState() => _CryptoWalletCardState();
}

class _CryptoWalletCardState extends State<CryptoWalletCard> {
  @override
  Widget build(BuildContext context) {
    double total = widget.wallet.crypto.price * widget.wallet.amount;

    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 20,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => VendaPage(moeda: widget.carteira),
          //   ),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.network(
                widget.wallet.crypto.icon,
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.wallet.crypto.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.wallet.amount.toStringAsFixed(3),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.05),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    price.format(total),
                    style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
