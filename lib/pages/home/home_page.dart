import 'package:crypto_currency/pages/home/favoritas_page.dart';
import 'package:crypto_currency/pages/home/moedas_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          MoedasPage(),
          FavoritasPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todas'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritas')
        ],
        onTap: (pagina) {
          controller.animateToPage(
            pagina,
            duration: const Duration(microseconds: 300),
            curve: Curves.easeIn,
          );
        },
        backgroundColor: Colors.black,
      ),
    );
  }
}
