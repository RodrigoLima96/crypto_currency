import 'package:flutter/material.dart';

appBarDinamica({
  required List selected,
  required Function cleanSelected,
}) {
  if (selected.isEmpty) {
    return AppBar(
      title: const Text('Crypto Currencies'),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  } else {
    return AppBar(
      leading: IconButton(
        onPressed: () => cleanSelected(),
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text('${selected.length} selected'),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}
