import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:crypto_currency/src/models/posicao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VendaPage extends StatefulWidget {
  final Posicao moeda;
  const VendaPage({Key? key, required this.moeda}) : super(key: key);

  @override
  _VendaPageState createState() => _VendaPageState();
}

class _VendaPageState extends State<VendaPage> {
  late NumberFormat real;
  double quantidade = 0;
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  late ContaRepository conta;

  readNumberFormat() {
    final loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  vender() async {
    //save on database

    if (_form.currentState!.validate()) {
      await conta.vender(widget.moeda.moeda, double.parse(_valor.text));

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Venda Realizada com sucesso')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    quantidade = widget.moeda.quantidade;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double total = widget.moeda.moeda.preco * widget.moeda.quantidade;
    conta = Provider.of<ContaRepository>(context, listen: false);

    readNumberFormat();
    return Scaffold(
      appBar: AppBar(
        title: Text('Vender ${widget.moeda.moeda.nome.toString()}'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: Image.network(
                widget.moeda.moeda.icone,
                height: 60,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
              width: size.width,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    quantidade.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green.shade300,
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green.shade500.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const Text(
              'Total',
              style: TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              real.format(
                (widget.moeda.quantidade * widget.moeda.moeda.preco),
              ),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                autofocus: true,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  label: Text('valor'),
                  prefix: Icon(
                    Icons.monetization_on_outlined,
                    size: 15,
                  ),
                  suffix: Text(
                    'Reais',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o valor da compra';
                  } else if (double.parse(value) > total) {
                    return 'Quantidade insuficiente de ${widget.moeda.moeda.sigla} na carteira';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(
                    () {
                      quantidade = (value.isEmpty)
                          ? widget.moeda.quantidade
                          : (double.parse(value) / widget.moeda.moeda.preco);
                    },
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () => vender(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
                      child: Text(
                        'Vender',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
