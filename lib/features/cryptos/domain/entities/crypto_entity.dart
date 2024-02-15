import 'package:equatable/equatable.dart';

class CryptoEntity extends Equatable {
  final String id;
  final String icon;
  final String name;
  final String symbol;
  final DateTime timeStamp;
  final double price;
  final double changeHour;
  final double changeDay;
  final double changeWeek;
  final double changeMonth;
  final double changeYear;
  final double changeAllTime;

  const CryptoEntity({
    required this.id,
    required this.icon,
    required this.name,
    required this.symbol,
    required this.timeStamp,
    required this.price,
    required this.changeHour,
    required this.changeDay,
    required this.changeWeek,
    required this.changeMonth,
    required this.changeYear,
    required this.changeAllTime,
  });

  @override
  List<Object?> get props => [
        id,
        icon,
        name,
        symbol,
        timeStamp,
        price,
        changeHour,
        changeDay,
        changeWeek,
        changeMonth,
        changeYear,
        changeAllTime,
      ];
}
