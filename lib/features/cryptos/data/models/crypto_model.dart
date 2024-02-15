import 'dart:convert';

import '../../domain/entities/entities.dart';

class CryptoModel extends CryptoEntity {
  const CryptoModel({
    required super.id,
    required super.icon,
    required super.name,
    required super.symbol,
    required super.timeStamp,
    required super.price,
    required super.changeHour,
    required super.changeDay,
    required super.changeWeek,
    required super.changeMonth,
    required super.changeYear,
    required super.changeAllTime,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        id: json['id'] ?? '',
        icon: json['icon'] ?? '',
        name: json['name'] ?? '',
        symbol: json['symbol'] ?? '',
        timeStamp: json['timeStamp'] ?? '',
        price: json['latest'] ?? '0',
        changeHour: json['changeHour'] ?? '0',
        changeDay: json['changeDay'] ?? '0',
        changeWeek: json['changeWeek'] ?? '0',
        changeMonth: json['changeMonth'] ?? '0',
        changeYear: json['changeYear'] ?? '0',
        changeAllTime: json['changeAllTime'] ?? '0',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'name': name,
        'symbol': symbol,
        'timeStamp': timeStamp,
        'latest': price,
        'changeHour': changeHour,
        'changeDay': changeDay,
        'changeWeek': changeWeek,
        'changeMonth': changeMonth,
        'changeYear': changeYear,
        'changeAllTime': changeAllTime,
      };

  static List<CryptoModel> toList(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    List<dynamic> dataList = jsonMap['data'];

    return dataList.map((item) => CryptoModel.fromJson(item)).toList();
  }
}
