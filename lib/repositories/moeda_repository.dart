import 'package:crypto_currency/models/moeda.dart';

class MoedasRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'assets/images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 159439.00,
    ),
    Moeda(
      icone: 'assets/images/cardano.png',
      nome: 'cardano',
      sigla: 'ADA',
      preco: 5.34,
    ),
    Moeda(
      icone: 'assets/images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 753.00,
    ),
    Moeda(
      icone: 'assets/images/litecoin.png',
      nome: 'Litcoin',
      sigla: 'LTC',
      preco: 345.00,
    ),
    Moeda(
      icone: 'assets/images/usdcoin.png',
      nome: 'Dolar',
      sigla: 'USD',
      preco: 5.45,
    ),
    Moeda(
      icone: 'assets/images/xrp.png',
      nome: 'Ripple',
      sigla: 'XRP',
      preco: 23.00,
    ),
  ];
}
