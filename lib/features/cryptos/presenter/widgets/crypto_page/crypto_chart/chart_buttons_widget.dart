import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import 'chart_button.dart';

class ChartButtonsWidget extends StatelessWidget {
  const ChartButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Row(
          children: [
            ChartButton(label: '1H', p: Period.hour),
            ChartButton(label: '24H', p: Period.day),
            ChartButton(label: '7D', p: Period.week),
            ChartButton(label: 'Month', p: Period.month),
            ChartButton(label: 'Year', p: Period.year),
            ChartButton(label: 'All', p: Period.all),
          ],
        ),
      ),
    );
  }
}