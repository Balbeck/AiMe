import 'package:flutter/material.dart';

class WeekCalendarRowStyle {
  static const EdgeInsets rowPadding =
      EdgeInsets.symmetric(horizontal: 8, vertical: 12);
  static const double cellHeight = 72;
  static const EdgeInsets cellMargin = EdgeInsets.symmetric(horizontal: 2);
  static const BorderRadius cellBorderRadius =
      BorderRadius.all(Radius.circular(8));
  static const Color emptyCellColor = Color(0x33FFFFFF);
  static const Border todayBorder =
      Border.fromBorderSide(BorderSide(color: Colors.white, width: 2));
  static const EdgeInsets labelPadding = EdgeInsets.only(top: 4, left: 4);
  static const TextStyle dayLetterStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle dayNumberStyle = TextStyle(
    fontSize: 10,
    color: Colors.white,
  );
  static const double iconSize = 24;
  static const Color iconColor = Colors.white;
}
