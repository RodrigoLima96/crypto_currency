class Crypto {
  String baseId;
  String icone;
  String nome;
  String sigla;
  double preco;
  DateTime timeStamp;
  double mudancaHora;
  double mudandaDia;
  double mudancaSemana;
  double mudancaMes;
  double mudancaAno;
  double mudancaPeriodoTotal;

  Crypto({
    required this.baseId,
    required this.icone,
    required this.nome,
    required this.sigla,
    required this.preco,
    required this.timeStamp,
    required this.mudancaHora,
    required this.mudandaDia,
    required this.mudancaSemana,
    required this.mudancaMes,
    required this.mudancaAno,
    required this.mudancaPeriodoTotal,
  });
}
