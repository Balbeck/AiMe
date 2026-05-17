import 'package:flutter/material.dart';

abstract class GoalListItemStyle {
  static const EdgeInsets margin = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 6.0,
  );
  static const EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 14.0,
  );

  static const BoxDecoration decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );
}
