import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_page_controller.dart';
import 'package:crypto_currency/src/modules/all_cryptos/pages/buy_crypto/widgets/chart/chart_button.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class CryptoChart extends StatefulWidget {
  final Crypto crypto;
  const CryptoChart({Key? key, required this.crypto}) : super(key: key);

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  late BuyCryptoPageController controller;

  setData() async {
    await controller.setData(widget.crypto.id);
  }

  @override
  Widget build(BuildContext context) {
    controller = context.watch<BuyCryptoPageController>();
    setData();
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: const [
                    ChartButton(label: '1H', p: Period.hour),
                    ChartButton(label: '24H', p: Period.day),
                    ChartButton(label: '7D', p: Period.week),
                    ChartButton(label: 'Month', p: Period.month),
                    ChartButton(label: 'Year', p: Period.year),
                    ChartButton(label: 'All', p: Period.all),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ValueListenableBuilder(
                valueListenable: controller.loaded,
                builder: (context, bool isLoaded, _) {
                  return (isLoaded)
                      ? LineChart(
                          getChartData(),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData getChartData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: controller.maxX,
      minY: controller.minY,
      maxY: controller.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: controller.chartData,
          isCurved: true,
          colors: controller.colors,
          barWidth: 3,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors: controller.colors
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
              final date = controller.getDate(item.spotIndex);
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
