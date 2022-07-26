import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/all_crypto_controller.dart';
import 'package:crypto_currency/src/routes/router_utils.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CryptoCard extends StatelessWidget {
  final Crypto crypto;
  const CryptoCard({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      elevation: 20,
      child: InkWell(
        onTap: () => context.push(AppPage.buyCrypto.toPath, extra: crypto),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.network(
                crypto.icon,
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        crypto.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        crypto.symbol,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.05),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  price.format(crypto.price),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: -1,
                  ),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                color: Colors.black,
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: ListTile(
                    title: const Text("Remove from favorites"),
                    onTap: () {
                      Navigator.pop(context);
                      Provider.of<AllCryptoController>(context, listen: false)
                          .removeFavCrypto(crypto);
                    },
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
