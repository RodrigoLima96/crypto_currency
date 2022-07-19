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
}
