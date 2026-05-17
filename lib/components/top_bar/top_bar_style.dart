import 'package:flutter/material.dart';

abstract class TopBarStyle {
  static const double height = 84.0;
  static const EdgeInsets buttonPadding = EdgeInsets.only(top: 28.0, left: 28.0);
  static const double buttonSize = 44.0;
  static const double iconSize = 22.0;
  static const Color iconColor = Colors.black87;
  static const BoxDecoration buttonDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
  );
}
