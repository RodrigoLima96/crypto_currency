import 'package:crypto_currency/configs/app_settings.dart';
import 'package:crypto_currency/pages/widgets/user_google_info.dart';
import 'package:crypto_currency/repositories/conta_repository.dart';
import 'package:crypto_currency/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late NumberFormat real;

  readNumberFormat() {
    final loc = context.read<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  @override
  Widget build(BuildContext context) {
    readNumberFormat();
    final conta = context.watch<ContaRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: const Text('Saldo'),
              subtitle: Text(
                real.format(conta.saldo),
                style: TextStyle(fontSize: 25, color: Colors.green.shade300),
              ),
              trailing: IconButton(
                  onPressed: () {
                    updateSaldo();
                  },
                  icon: const Icon(Icons.edit)),
            ),
            const Divider(),
            const UserInfo(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: OutlinedButton(
                onPressed: () => context.read<AuthService>().logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Sair',
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  updateSaldo() async {
    final form = GlobalKey<FormState>();
    final valor = TextEditingController();
    final conta = context.read<ContaRepository>();

    valor.text = conta.saldo.toString();

    AlertDialog dialog = AlertDialog(
      title: const Text(
        'Atualizar Saldo',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: form,
        child: TextFormField(
          controller: valor,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
          ],
          validator: (value) {
            if (value!.isEmpty) return 'Informe o valor do saldo';
            return null;
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCELAR'),
            ),
            TextButton(
              onPressed: () {
                if (form.currentState!.validate()) {
                  conta.setSaldo(double.parse(valor.text));
                  Navigator.pop(context);
                }
              },
              child: const Text('SALVAR'),
            )
          ],
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }
}
