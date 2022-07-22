class Crypto {
  String id;
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
    required this.id,
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
