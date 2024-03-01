import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class ListDivider extends StatelessWidget {
  const ListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        color: greyColor.withOpacity(0.3),
        height: 0.1,
      ),
    );
  }
}
