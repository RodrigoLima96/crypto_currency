import 'crypto.dart';

class Historico {
  DateTime dataOperacao;
  String tipoOperacao;
  Crypto moeda;
  double valor;
  double quantidade;

  Historico({
    required this.dataOperacao,
    required this.tipoOperacao,
    required this.moeda,
    required this.valor,
    required this.quantidade,
  });
}
