import 'package:crypto_currency/src/modules/transactions/controllers/transactions_controller.dart';
import 'package:crypto_currency/src/shared/utils/methods.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletChart extends StatefulWidget {
  const WalletChart({Key? key}) : super(key: key);

  @override
  State<WalletChart> createState() => _WalletChartState();
}

class _WalletChartState extends State<WalletChart> {
  int index = 0;
  String chartLabel = '';
  double chartValue = 0;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionsController>();

    setChartData(int index) async {
      if (index < 0) return;

      if (index == controller.wallet.length) {
        chartLabel = 'Balance';
        chartValue = controller.balance;
      } else {
        chartLabel = controller.wallet[index].crypto.name;
        chartValue = controller.wallet[index].crypto.price *
            controller.wallet[index].amount;
      }
    }

    loadWallet(int index) {
      setChartData(index);
      final listLength = controller.wallet.length + 1;

      return List.generate(listLength, (i) {
        final isTouched = i == index;
        final isSaldo = i == listLength - 1;
        final fontSize = isTouched ? 18.0 : 14.0;
        final radius = isTouched ? 60.0 : 50.0;
        final color = isTouched ? Colors.teal : Colors.tealAccent[400];

        double percent = 0;

        if (!isSaldo) {
          percent = controller.wallet[i].crypto.price *
              controller.wallet[i].amount /
              controller.totalBalance;
        } else {
          percent = (controller.balance > 0)
              ? controller.balance / controller.totalBalance
              : 0;
        }
        percent *= 100;

        return PieChartSectionData(
          color: color,
          value: percent,
          title: '${percent.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        );
      });
    }

    return controller.totalBalance <= 0
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          index + 1;
                          return;
                        }
                        index = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    }),
                    sectionsSpace: 5,
                    centerSpaceRadius: 120,
                    sections: loadWallet(index),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    chartLabel,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    price.format(
                      chartValue,
                    ),
                    style: const TextStyle(
                      fontSize: 28,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
