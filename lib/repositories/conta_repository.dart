import 'package:crypto_currency/database/db.dart';
import 'package:crypto_currency/repositories/moeda_repository.dart';
import 'package:crypto_currency/src/models/historico.dart';
import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/models/posicao.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ContaRepository extends ChangeNotifier {
  late Database db;
  List<Posicao> _carteira = [];
  List<Historico> _historico = [];
  double _saldo = 0;
  MoedasRepository moedas;

  get saldo => _saldo;
  List<Posicao> get carteira => _carteira;
  List<Historico> get historico => _historico;

  ContaRepository({required this.moedas}) {
    _initRepository();
  }

  _initRepository() async {
    await _getSaldo();
    await _getCarteira();
    await _getHistorico();
  }

  _getSaldo() async {
    db = await DB.instance.database;
    List conta = await db.query('conta', limit: 1);
    _saldo = conta.first['saldo'];
    notifyListeners();
  }

  setSaldo(double valor) async {
    db = await DB.instance.database;
    db.update('conta', {'saldo': valor});

    _saldo = valor;
    notifyListeners();
  }

  comprar(Crypto moeda, double valor) async {
    db = await DB.instance.database;

    await db.transaction((txn) async {
      // Verifica se a moeda já foi comprada
      final posicaoMoeda = await txn.query(
        'carteira',
        where: 'sigla = ?',
        whereArgs: [moeda.sigla],
      );

      // Se não tem a moeda em carteira
      if (posicaoMoeda.isEmpty) {
        await txn.insert('carteira', {
          'sigla': moeda.sigla,
          'moeda': moeda.nome,
          'quantidade': (valor / moeda.preco).toString()
        });
      }

      // Já tem a moeda em carteira
      else {
        final atual = double.parse(posicaoMoeda.first['quantidade'].toString());
        await txn.update(
          'carteira',
          {'quantidade': ((valor / moeda.preco) + atual).toString()},
          where: 'sigla = ?',
          whereArgs: [moeda.sigla],
        );
      }

      // Inserir a compra no histórico
      await txn.insert('historico', {
        'sigla': moeda.sigla,
        'moeda': moeda.nome,
        'quantidade': (valor / moeda.preco).toString(),
        'valor': valor,
        'tipo_operacao': 'compra',
        'data_operacao': DateTime.now().millisecondsSinceEpoch
      });

      //Atualizar o saldo
      await txn.update('conta', {'saldo': saldo - valor});
    });

    await _initRepository();
    notifyListeners();
  }

  vender(Crypto moeda, double valor) async {
    db = await DB.instance.database;

    await db.transaction((txn) async {
      final posicaoMoeda = await txn.query(
        'carteira',
        where: 'sigla = ?',
        whereArgs: [moeda.sigla],
      );

      final atual = double.parse(posicaoMoeda.first['quantidade'].toString());

      await txn.update(
        'carteira',
        {'quantidade': (atual - (valor / moeda.preco)).toString()},
        where: 'sigla = ?',
        whereArgs: [moeda.sigla],
      );

      if (atual - (valor / moeda.preco) == 0) {
        await txn
            .delete('carteira', where: 'sigla = ?', whereArgs: [moeda.sigla]);
      }

      await txn.insert('historico', {
        'sigla': moeda.sigla,
        'moeda': moeda.nome,
        'quantidade': (valor / moeda.preco).toString(),
        'valor': valor,
        'tipo_operacao': 'venda',
        'data_operacao': DateTime.now().millisecondsSinceEpoch
      });

      await txn.update('conta', {'saldo': saldo + valor});
    });

    await _initRepository();
    notifyListeners();
  }

  _getCarteira() async {
    _carteira = [];
    List posicoes = await db.query('carteira');
    // ignore: avoid_function_literals_in_foreach_calls
    posicoes.forEach((posicao) {
      Crypto moeda = moedas.tabela.firstWhere(
        (m) => m.sigla == posicao['sigla'],
      );
      _carteira.add(
        Posicao(
          moeda: moeda,
          quantidade: double.parse(posicao['quantidade']),
        ),
      );
    });
    notifyListeners();
  }

  _getHistorico() async {
    _historico = [];
    List operacoes = await db
        .rawQuery('SELECT * FROM historico ORDER BY data_operacao DESC');
    // ignore: avoid_function_literals_in_foreach_calls
    operacoes.forEach((operacao) {
      Crypto moeda = moedas.tabela.firstWhere(
        (m) => m.sigla == operacao['sigla'],
      );
      _historico.add(
        Historico(
          dataOperacao:
              DateTime.fromMillisecondsSinceEpoch(operacao['data_operacao']),
          tipoOperacao: operacao['tipo_operacao'],
          moeda: moeda,
          valor: operacao['valor'],
          quantidade: double.parse(operacao['quantidade']),
        ),
      );
    });
    notifyListeners();
  }
}
