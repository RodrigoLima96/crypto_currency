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
        icon: json['image_url'] ?? '',
        name: json['name'] ?? '',
        symbol: json['symbol'] ?? '',
        timeStamp: json['latest_price']['timestamp'] ?? '',
        price: double.parse(json['latest']),
        changeHour: json['latest_price']['percent_change']['hour'] ?? 0.0,
        changeDay: json['latest_price']['percent_change']['day'] ?? 0.0,
        changeWeek: json['latest_price']['percent_change']['week'] ?? 0.0,
        changeMonth: json['latest_price']['percent_change']['month'] ?? 0.0,
        changeYear: json['latest_price']['percent_change']['year'] ?? 0.0,
        changeAllTime: json['latest_price']['percent_change']['all'] ?? 0.0,
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

  static List<Map<String, dynamic>> getCryptoPrices({required String data}) {
    List<Map<String, dynamic>> prices = [];

    var jsonMap = json.decode(data);
    final Map<String, dynamic> crypto = jsonMap['data']['prices'];

    prices.add(crypto['hour']);
    prices.add(crypto['day']);
    prices.add(crypto['week']);
    prices.add(crypto['month']);
    prices.add(crypto['year']);
    prices.add(crypto['all']);

    return prices;
  }
}
