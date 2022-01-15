import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/models/moeda.dart';
import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CompraPage extends StatefulWidget {
  final Moeda moeda;
  const CompraPage({Key? key, required this.moeda}) : super(key: key);

  @override
  _CompraPageState createState() => _CompraPageState();
}

class _CompraPageState extends State<CompraPage> {
  late NumberFormat real;
  double quantidade = 0;
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  late ContaRepository conta;

  comprar() async {
    if (_form.currentState!.validate()) {
      //save on database
      await conta.comprar(widget.moeda, double.parse(_valor.text));

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Compra realizada com sucesso")),
      );
    }
  }

  readNumberFormat() {
    final loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  @override
  Widget build(BuildContext context) {
    readNumberFormat();
    conta = Provider.of<ContaRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    widget.moeda.icone,
                    scale: 2.5,
                  ),
                  Container(
                    width: 40,
                  ),
                  Text(
                    real.format(widget.moeda.preco),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: (quantidade > 0)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          "$quantidade ${widget.moeda.sigla}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green.shade300,
                          ),
                        ))
                    : null,
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green.shade500.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                autofocus: true,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  label: Text("Valor"),
                  prefix: Icon(
                    Icons.monetization_on_outlined,
                    size: 15,
                  ),
                  suffix: Text(
                    "Reais",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o valor da compra";
                  } else if (double.parse(value) < 50) {
                    return "A compra mínima é R\$ 50,00";
                  } else if (double.parse(value) > conta.saldo) {
                    return "Saldo insuficiente";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    quantidade = (value.isEmpty)
                        ? 0
                        : double.parse(value) / widget.moeda.preco;
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () => comprar(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
                      child: Text(
                        "Comprar",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
