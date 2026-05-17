import 'package:flutter/material.dart';

abstract class DayVoteResultStyle {
  static const String messageFirstLine = "Aujourd'hui a été une journée";

  static const TextStyle messageStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle qualifierStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const double displaySize = 72.0;
  static const double innerIconSize = 34.0;
  static const Color innerIconColor = Colors.white;

  static const BoxDecoration scoreCircleDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
  );

  static const TextStyle scoreLabelStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const double messageScoreGap = 32.0;
  static const double scoreIconGap = 20.0;
}
