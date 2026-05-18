import 'package:flutter/material.dart';

abstract class CigaretteAddButtonStyle {
  static const double size = 80.0;
  static const double iconSize = 38.0;
  static const Color iconColor = Colors.black87;
  static const BoxDecoration decoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFFFFC107),
    border: Border.fromBorderSide(
      BorderSide(color: Color(0xFFFF6D00), width: 3.5),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0x55FF6D00),
        blurRadius: 12,
        spreadRadius: 2,
      ),
    ],
  );
}
