import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

int randomNumber() {
  Random random = Random();
  return random.nextInt(1000);
}

int uuid() {
  int date = DateTime.now().millisecondsSinceEpoch;
  return date;
}

void printLog(String text) {
  debugPrint('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  debugPrint('\x1B[31m$text\x1B[0m');
}

String formatTime(double time) {
  Duration duration = Duration(milliseconds: time.round());
  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(':');
}

String dateFormatter({
  required String date,
  String format = 'yyyy-MM-dd',
}) {
  return DateFormat(format).format(DateTime.parse(date));
}

DateTime getDateWithZeroHours({
  required DateTime date,
}) {
  DateTime formatedDate = date.subtract(Duration(
      hours: date.hour,
      minutes: date.minute,
      seconds: date.second,
      milliseconds: date.millisecond,
      microseconds: date.microsecond));
  return formatedDate;
}

DateTime firstDay() {
  DateTime d = DateTime.now();
  return DateTime(d.year, d.month, 01);
}

DateTime currentDay() {
  DateTime d = DateTime.now();
  return DateTime(d.year, d.month, d.day);
}

DateTime monthFirstDay({DateTime? currentDate}) {
  DateTime d = currentDate ?? DateTime.now();
  return DateTime(d.year, d.month, 01);
}

DateTime yearFirstDay({DateTime? currentDate}) {
  DateTime d = currentDate ?? DateTime.now();
  return DateTime(d.year, 01, 01);
}

DateTime weekFirstDay({DateTime? currentDate}) {
  DateTime now = currentDate ?? DateTime.now();
  int currentDay = now.weekday;
  DateTime d = now.subtract(Duration(days: currentDay - 0)); //0-Sunday
  return DateTime(d.year, d.month, d.day);
}

DateTime monthLastDay({DateTime? currentDate}) {
  DateTime d = currentDate ?? DateTime.now();
  return DateTime(d.year, d.month + 1, 0);
}

DateTime yearLastDay({DateTime? currentDate}) {
  DateTime d = currentDate ?? DateTime.now();
  return DateTime(d.year, 12, 31);
}
