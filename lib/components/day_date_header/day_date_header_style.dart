import 'package:flutter/material.dart';

abstract class DayDateHeaderStyle {
  static const EdgeInsets padding = EdgeInsets.only(top: 100.0, bottom: 8.0);

  static const TextStyle weekdayStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: 0.5,
  );

  static const TextStyle dateStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
