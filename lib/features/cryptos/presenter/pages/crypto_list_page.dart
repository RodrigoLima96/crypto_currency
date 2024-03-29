import 'package:flutter/material.dart';

import '../../../../core/widgets/widgets.dart';
import '../widgets/widgets.dart';

class CryptoListPage extends StatelessWidget {
  const CryptoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(title: 'Crypto Currencies'),
      body: CryptoList(),
    );
  }
}