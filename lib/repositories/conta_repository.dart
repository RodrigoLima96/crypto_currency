import 'package:crypto_currency/src/services/sqLite/sqlite_service.dart';
import 'package:crypto_currency/src/modules/crypto/crypto_list/controllers/crypto_controller.dart';
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
    db = await SqLiteService.instance.database;
    List conta = await db.query('conta', limit: 1);
    _saldo = conta.first['saldo'];
    notifyListeners();
  }

  setSaldo(double valor) async {
    db = await SqLiteService.instance.database;
    db.update('conta', {'saldo': valor});

    _saldo = valor;
    notifyListeners();
  }

  comprar(Crypto moeda, double valor) async {
    db = await SqLiteService.instance.database;

    await db.transaction((txn) async {
      // Verifica se a moeda já foi comprada
      final posicaoMoeda = await txn.query(
        'carteira',
        where: 'sigla = ?',
        whereArgs: [moeda.symbol],
      );

      // Se não tem a moeda em carteira
      if (posicaoMoeda.isEmpty) {
        await txn.insert('carteira', {
          'sigla': moeda.symbol,
          'moeda': moeda.name,
          'quantidade': (valor / moeda.price).toString()
        });
      }

      // Já tem a moeda em carteira
      else {
        final atual = double.parse(posicaoMoeda.first['quantidade'].toString());
        await txn.update(
          'carteira',
          {'quantidade': ((valor / moeda.price) + atual).toString()},
          where: 'sigla = ?',
          whereArgs: [moeda.symbol],
        );
      }

      // Inserir a compra no histórico
      await txn.insert('historico', {
        'sigla': moeda.symbol,
        'moeda': moeda.name,
        'quantidade': (valor / moeda.price).toString(),
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
    db = await SqLiteService.instance.database;

    await db.transaction((txn) async {
      final posicaoMoeda = await txn.query(
        'carteira',
        where: 'sigla = ?',
        whereArgs: [moeda.symbol],
      );

      final atual = double.parse(posicaoMoeda.first['quantidade'].toString());

      await txn.update(
        'carteira',
        {'quantidade': (atual - (valor / moeda.price)).toString()},
        where: 'sigla = ?',
        whereArgs: [moeda.symbol],
      );

      if (atual - (valor / moeda.price) == 0) {
        await txn
            .delete('carteira', where: 'sigla = ?', whereArgs: [moeda.symbol]);
      }

      await txn.insert('historico', {
        'sigla': moeda.symbol,
        'moeda': moeda.name,
        'quantidade': (valor / moeda.price).toString(),
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
      Crypto moeda = moedas.table.firstWhere(
        (m) => m.symbol == posicao['sigla'],
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
      Crypto moeda = moedas.table.firstWhere(
        (m) => m.symbol == operacao['sigla'],
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
