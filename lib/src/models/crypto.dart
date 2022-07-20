import 'dart:convert';

class Crypto {
  String baseId;
  String icon;
  String name;
  String symbol;
  double price;
  DateTime timeStamp;
  double changeHour;
  double changeDay;
  double changeWeek;
  double changeMonth;
  double changeYear;
  double changeAllTime;

  Crypto({
    required this.baseId,
    required this.icon,
    required this.name,
    required this.symbol,
    required this.price,
    required this.timeStamp,
    required this.changeHour,
    required this.changeDay,
    required this.changeWeek,
    required this.changeMonth,
    required this.changeYear,
    required this.changeAllTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseId': baseId,
      'icon': icon,
      'name': name,
      'symbol': symbol,
      'price': price,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'changeHour': changeHour,
      'changeDay': changeDay,
      'changeWeek': changeWeek,
      'changeMonth': changeMonth,
      'changeYear': changeYear,
      'changeAllTime': changeAllTime,
    };
  }

  factory Crypto.fromMap(Map<String, dynamic> map) {
    return Crypto(
      baseId: map['baseId'] ?? '',
      icon: map['icon'] ?? '',
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp']),
      changeHour: map['changeHour']?.toDouble() ?? 0.0,
      changeDay: map['changeDay']?.toDouble() ?? 0.0,
      changeWeek: map['changeWeek']?.toDouble() ?? 0.0,
      changeMonth: map['changeMonth']?.toDouble() ?? 0.0,
      changeYear: map['changeYear']?.toDouble() ?? 0.0,
      changeAllTime: map['changeAllTime']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Crypto.fromJson(String source) => Crypto.fromMap(json.decode(source));
}
