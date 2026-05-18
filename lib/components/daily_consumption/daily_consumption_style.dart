import 'package:flutter/material.dart';

abstract class DailyConsumptionStyle {
  static const String title = "Consommation aujourd'hui";
  static const Color cigaretteColor = Color(0xFFFF6D00);
  static const Color cbdColor = Color(0xFF66BB6A);

  static const double iconButtonSize = 36.0;
  static const double iconSize = 18.0;

  static const BoxDecoration cigaretteIconDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFFFFC107),
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFFFF6D00), width: 2.0),
    ),
  );
  static const BoxDecoration cbdIconDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFF66BB6A),
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFF2E7D32), width: 2.0),
    ),
  );
  static const Color cigaretteIconColor = Colors.black87;
  static const Color cbdIconColor = Colors.white;

  static const TextStyle titleStyle = TextStyle(
    fontSize: 14,
    color: Colors.white70,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle countStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle labelStyle = TextStyle(
    fontSize: 13,
    color: Colors.white70,
  );

  static const double statSpacing = 48.0;
  static const double titleBottomGap = 12.0;
  static const double countLabelGap = 4.0;

  static const EdgeInsets padding =
      EdgeInsets.symmetric(vertical: 16, horizontal: 24);
  static const BoxDecoration containerDecoration = BoxDecoration(
    color: Color(0xEE1A1A2E),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
  static const EdgeInsets containerMargin =
      EdgeInsets.symmetric(horizontal: 12);
}
