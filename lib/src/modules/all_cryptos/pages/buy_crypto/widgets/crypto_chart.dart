import 'package:crypto_currency/src/models/crypto.dart';
import 'package:crypto_currency/src/modules/all_cryptos/controllers/buy_crypto_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CryptoChart extends StatefulWidget {
  final Crypto crypto;
  const CryptoChart({Key? key, required this.crypto}) : super(key: key);

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  ValueNotifier<bool> loaded = ValueNotifier(false);
  List<Color> colors = [const Color(0xFF3F51B5)];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;
  List allData = [];
  List<FlSpot> chartData = [];
  List<Map<String, dynamic>> historic = [];
  late BuyCryptoController controller;

  setData() async {
    loaded.value = false;
    chartData = [];

    if (historic.isEmpty) {
      historic = await controller.getHistoricPrices(widget.crypto.id);
    }

    allData = historic[controller.period.index]['prices'];
    allData = allData.reversed.map((item) {
      double preco = double.parse(item[0]);
      int time = int.parse(item[1].toString() + '000');
      return [preco, DateTime.fromMillisecondsSinceEpoch(time)];
    }).toList();

    maxX = allData.length.toDouble();
    maxY = 0;
    minY = double.infinity;

    for (var item in allData) {
      maxY = item[0] > maxY ? item[0] : maxY;
      minY = item[0] < minY ? item[0] : minY;
    }

    for (var i = 0; i < allData.length; i++) {
      chartData.add(FlSpot(
        i.toDouble(),
        allData[i][0],
      ));
    }

    loaded.value = true;
  }

  getDate(int index) {
    DateTime date = allData[index][1];
    if (controller.period != Period.year && controller.period != Period.all) {
      return DateFormat('dd/MM - hh:mm').format(date);
    } else {
      return DateFormat('dd/MM/y').format(date);
    }
  }

  LineChartData getChartData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: chartData,
          isCurved: true,
          colors: colors,
          barWidth: 3,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors: colors.map((color) => color.withOpacity(0.15)).toList(),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          getTooltipItems: (data) {
            return data.map((item) {
              final date = getDate(item.spotIndex);
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

  chartButton(Period p, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
          onPressed: () => setState(() => controller.period = p),
          child: Text(label),
          style: (controller.period != p)
              ? ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
                )
              : ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(colors[0]),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
                )),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller = context.watch<BuyCryptoController>();
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
                  children: [
                    chartButton(Period.hour, '1H'),
                    chartButton(Period.day, '24H'),
                    chartButton(Period.week, '7D'),
                    chartButton(Period.month, 'Month'),
                    chartButton(Period.year, 'Year'),
                    chartButton(Period.all, 'All'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ValueListenableBuilder(
                valueListenable: loaded,
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
}
