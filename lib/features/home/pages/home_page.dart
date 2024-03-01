import 'package:flutter/material.dart';

import '../../../core/widgets/widgets.dart';
import '../../cryptos/presenter/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(title: 'Crypto Currencies'),
      body: CryptoList(),
    );
  }
}