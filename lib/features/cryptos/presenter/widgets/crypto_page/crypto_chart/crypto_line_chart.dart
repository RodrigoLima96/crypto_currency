import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../store/store.dart';
// import 'package:fl_chart/fl_chart.dart';

class CryptoLineChart extends StatefulWidget {
  final String cryptoId;

  const CryptoLineChart({super.key, required this.cryptoId});

  @override
  State<CryptoLineChart> createState() => _CryptoLineChartState();
}

class _CryptoLineChartState extends State<CryptoLineChart> {
  final cryptoPageStore = Modular.get<CryptoPageStore>();

  @override
  void initState() {
    super.initState();
    cryptoPageStore.getCryptoPrices(cryptoId: widget.cryptoId, firstLoad: true);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Padding(
              padding: const EdgeInsets.only(top: 120),
              child: LineChart(
                getChartData(),
              ),
            ));
  }

  LineChartData getChartData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: cryptoPageStore.maxX,
      minY: cryptoPageStore.minY,
      maxY: cryptoPageStore.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: cryptoPageStore.chartData,
          isCurved: true,
          colors: lineChartColors,
          barWidth: 3,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors: lineChartColors
                .map((color) => color.withOpacity(0.15))
                .toList(),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          getTooltipItems: (data) {
            return data.map((item) {
              final date = cryptoPageStore.getDate(item.spotIndex);
              return LineTooltipItem(
                price.format(item.y),
                const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: '\n $date',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
