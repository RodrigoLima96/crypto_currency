import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

class CryptoLineChart extends StatelessWidget {
  const CryptoLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
    // Builder(
    //   builder: (_) => LineChart(
    //       // getChartData(),
    //       ),
    // );
  }

  // LineChartData getChartData() {
  //   return LineChartData(
  //     gridData: FlGridData(show: false),
  //     titlesData: FlTitlesData(show: false),
  //     borderData: FlBorderData(show: false),
  //     minX: 0,
  //     maxX: controller.maxX,
  //     minY: controller.minY,
  //     maxY: controller.maxY,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: controller.chartData,
  //         isCurved: true,
  //         colors: controller.colors,
  //         barWidth: 3,
  //         dotData: FlDotData(show: false),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           colors: controller.colors
  //               .map((color) => color.withOpacity(0.15))
  //               .toList(),
  //         ),
  //       ),
  //     ],
  //     lineTouchData: LineTouchData(
  //       touchTooltipData: LineTouchTooltipData(
  //         tooltipBgColor: Colors.black,
  //         getTooltipItems: (data) {
  //           return data.map((item) {
  //             final date = controller.getDate(item.spotIndex);
  //             return LineTooltipItem(
  //               price.format(item.y),
  //               const TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //               children: [
  //                 TextSpan(
  //                   text: '\n $date',
  //                   style: const TextStyle(
  //                     fontSize: 12,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ],
  //             );
  //           }).toList();
  //         },
  //       ),
  //     ),
  //   );
  // }
}
