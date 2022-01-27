import 'dart:async';
import 'dart:convert';
import 'package:crypto_currency/database/db.dart';
import 'package:crypto_currency/models/moeda.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class MoedasRepository extends ChangeNotifier {
  List<Moeda> _tabela = [];
  late Timer intervalo;

  List<Moeda> get tabela => _tabela;

  MoedasRepository() {
    _setupMoedasTable();
    _setupDadosTableMoeda();
    _readMoedasTable();
    _refreshPrecos();
  }

  getHistoricoMoeda(Moeda moeda) async {
    final response = await http.get(
      Uri.parse(
        'https://api.coinbase.com/v2/assets/prices/${moeda.baseId}?base=BRL',
      ),
    );

    List<Map<String, dynamic>> precos = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Map<String, dynamic> moeda = json['data']['prices'];

      precos.add(moeda['hour']);
      precos.add(moeda['day']);
      precos.add(moeda['week']);
      precos.add(moeda['month']);
      precos.add(moeda['year']);
      precos.add(moeda['all']);
    }

    return precos;
  }

  _refreshPrecos() async {
    intervalo =
        Timer.periodic(const Duration(minutes: 1), (_) => checkPrecos());
  }

  checkPrecos() async {
    String uri = 'https://api.coinbase.com/v2/assets/search?base=BRL';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> moedas = json['data'];
      Database db = await DB.instance.database;
      Batch batch = db.batch();

      // ignore: avoid_function_literals_in_foreach_calls
      _tabela.forEach((atual) {
        // ignore: avoid_function_literals_in_foreach_calls
        moedas.forEach((novo) {
          if (atual.baseId == novo['id']) {
            final moeda = novo;
            final preco = moeda['latest_price'];
            final timestamp = DateTime.parse(novo['latest_price']['timestamp']);

            batch.update(
              'moedas',
              {
                'preco': moeda['latest'],
                'timestamp': timestamp.millisecondsSinceEpoch,
                'mudancaHora': preco['percent_change']['hour'].toString(),
                'mudancaDia': preco['percent_change']['day'].toString(),
                'mudancaSemana': preco['percent_change']['week'].toString(),
                'mudancaMes': preco['percent_change']['month'].toString(),
                'mudancaAno': preco['percent_change']['year'].toString(),
                'mudancaPeriodoTotal': preco['percent_change']['all'].toString()
              },
              where: 'baseId = ?',
              whereArgs: [atual.baseId],
            );
          }
        });
      });

      // List teste1 = await db.query('moedas');

      // for (var i = 0; i < teste1.length; i++) {
      //   print(teste1[i]['sigla']);
      //   print(teste1[i]['preco']);
      // }

      await batch.commit(noResult: true);
      await _readMoedasTable();
    }
  }

  _readMoedasTable() async {
    Database db = await DB.instance.database;
    List resultados = await db.query('moedas');

    _tabela = resultados.map((row) {
      return Moeda(
        baseId: row['baseId'],
        icone: row['icone'],
        nome: row['nome'],
        sigla: row['sigla'],
        preco: double.parse(row['preco']),
        timeStamp: DateTime.fromMillisecondsSinceEpoch(row['timestamp']),
        mudancaHora: double.parse(row['mudancaHora']),
        mudandaDia: double.parse(row['mudancaDia']),
        mudancaSemana: double.parse(row['mudancaSemana']),
        mudancaMes: double.parse(row['mudancaMes']),
        mudancaAno: double.parse(row['mudancaAno']),
        mudancaPeriodoTotal: double.parse(row['mudancaPeriodoTotal']),
      );
    }).toList();

    notifyListeners();
  }

  _moedasTableIsEmpty() async {
    Database db = await DB.instance.database;
    List resultados = await db.query('moedas');
    return resultados.isEmpty;
  }

  _setupDadosTableMoeda() async {
    if (await _moedasTableIsEmpty()) {
      String uri = 'https://api.coinbase.com/v2/assets/search?base=BRL';
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> moedas = json['data'];

        Database db = await DB.instance.database;
        Batch batch = db.batch();

        // ignore: avoid_function_literals_in_foreach_calls
        moedas.forEach((moeda) {
          final preco = moeda['latest_price'];
          final timestamp = DateTime.parse(preco['timestamp']);

          batch.insert('moedas', {
            'baseId': moeda['id'],
            'sigla': moeda['symbol'],
            'nome': moeda['name'],
            'icone': moeda['image_url'],
            'preco': moeda['latest'],
            'timestamp': timestamp.millisecondsSinceEpoch,
            'mudancaHora': preco['percent_change']['hour'].toString(),
            'mudancaDia': preco['percent_change']['day'].toString(),
            'mudancaSemana': preco['percent_change']['week'].toString(),
            'mudancaMes': preco['percent_change']['month'].toString(),
            'mudancaAno': preco['percent_change']['year'].toString(),
            'mudancaPeriodoTotal': preco['percent_change']['all'].toString()
          });
        });

        await batch.commit(noResult: true);
      }
    }
  }

  _setupMoedasTable() async {
    const String table = '''
    CREATE TABLE IF NOT EXISTS moedas (
      baseId TEXT PRIMARY KEY,
      sigla TEXT,
      nome TEXT,
      icone TEXT,
      preco TEXT,
      timestamp INTEGER,
      mudancaHora TEXT,
      mudancaDia TEXT,
      mudancaSemana TEXT,
      mudancaMes TEXT,
      mudancaAno TEXT,
      mudancaPeriodoTotal TEXT
    );
    ''';

    Database db = await DB.instance.database;
    await db.execute(table);
  }
}
