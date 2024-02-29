// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../store/crypto_store.dart';

class CryptosPage extends StatefulWidget {
  const CryptosPage({Key? key}) : super(key: key);

  @override
  CryptosPageState createState() => CryptosPageState();
}

class CryptosPageState extends State<CryptosPage> {

  final cryptoStore = Modular.get<CryptoStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('MobX Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Observer(
                  builder: (_) => Text(
                        'Crypto: ${cryptoStore.cryptosList.length}',
                        style: const TextStyle(fontSize: 40),
                      )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => cryptoStore.getCryptos(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}