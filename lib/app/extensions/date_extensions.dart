import 'package:intl/intl.dart';

extension DateFormatEx on String {
  String timeFromString() {
    return DateFormat('hh:mm a')
        .format(
          DateTime.parse(this),
        )
        .toString();
  }

  String dateFromString() {
    return DateFormat('dd/MM/yyyy')
        .format(
          DateTime.parse(this),
        )
        .toString();
  }
}

extension DateFormatExInteger on int {
  String convertMilliSecondsToDateString() {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(this);
    return extractStringDateFromDateTime(date);
  }
}

int convertDateToMilliSeconds(DateTime dateTime) {
  final DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
  return date.millisecondsSinceEpoch;
}

int getDaysNumber(DateTime startDateTime, DateTime endDateTime) {
  return startDateTime.difference(endDateTime).inDays;
}

DateTime convertMilliSecondsToDate(int millisecondsSinceEpoch) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  return date;
}

String convertMilliSecondsToDateString(int millisecondsSinceEpoch) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  return extractStringDateFromDateTime(date);
}

DateTime extractDateFromDateTime(DateTime dateTime) {
  final DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
  return date;
}

String extractStringDateFromDateTime(DateTime dateTime) {
  final DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
  return DateFormat('dd/MM/yyyy')
      .format(
        date,
      )
      .toString();
}

class test {
  test() {
    String x = '2022-05-16T10:48:37.59';
    x.timeFromString();
  }
}
