import 'package:flutter/material.dart';

abstract class CbdAddButtonStyle {
  static const double size = 80.0;
  static const double iconSize = 38.0;
  static const Color iconColor = Colors.white;
  static const BoxDecoration decoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFF66BB6A),
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFF2E7D32), width: 3.5),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0x552E7D32),
        blurRadius: 12,
        spreadRadius: 2,
      ),
    ],
  );
}
