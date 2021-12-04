import 'package:flutter/material.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({Key? key}) : super(key: key);

  @override
  _FavoritasPageState createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moedas favoritas"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
