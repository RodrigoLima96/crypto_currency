import 'package:flutter/material.dart';

import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/entities.dart';
import '../widgets/widgets.dart';

class CryptoPage extends StatelessWidget {
  final CryptoEntity cryptoEntity;

  const CryptoPage({super.key, required this.cryptoEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: cryptoEntity.name),
      body: CryptoPageBody(cryptoEntity: cryptoEntity),
    );
  }
}
