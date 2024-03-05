import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color blackColor = Color.fromARGB(255, 0, 0, 0);
const Color backgroundColor = Color(0xFF303030);
const Color greyColor = Colors.grey;
const Color whiteColor = Colors.white;

NumberFormat price = NumberFormat.currency(locale: 'en_US', name: '\$');

enum Period { hour, day, week, month, year, all }

List<Color> lineChartColors = [const Color(0xFF3F51B5)];
