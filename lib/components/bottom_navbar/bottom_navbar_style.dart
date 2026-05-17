import 'package:flutter/material.dart';

abstract class BottomNavbarStyle {
  static const double height = 100.0;
  static const double itemGap = 16.0;
  static const int virtualMultiplier = 1000;

  static const double borderWidth = 1.0;
  static const Color borderColor = Color(0xFFBDBDBD);
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 0.36);

  static const BoxDecoration decoration = BoxDecoration(color: backgroundColor);
}
