import 'package:flutter/material.dart';

abstract class NextDeadlineStyle {
  static const String emptyMessage = 'Aucun Objectif ou Projet en cours...';
  static const String deadlineLabel = 'Prochaine Deadline :';
  static const String daysSuffix = 'j';

  static const TextStyle emptyStyle = TextStyle(
    fontSize: 13,
    color: Colors.black45,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle labelStyle = TextStyle(
    fontSize: 13,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleStyle = TextStyle(
    fontSize: 14,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle daysStyle = TextStyle(
    fontSize: 16,
    color: Color(0xFFD32F2F),
    fontWeight: FontWeight.bold,
  );
  static const Color daysBorderColor = Color(0xFFD32F2F);
  static const double daysBadgeSize = 44.0;
  static const double daysBorderWidth = 2.0;
  static const double labelTitleGap = 3.0;

  static const double itemSpacing = 8.0;
  static const EdgeInsets padding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  static const BoxDecoration containerDecoration = BoxDecoration(
    color: Color(0xCCFFFFFF),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  static const BoxDecoration titleDecoration = BoxDecoration(
    border: Border.fromBorderSide(BorderSide(color: Colors.black45, width: 1.5)),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static const EdgeInsets titlePadding =
      EdgeInsets.symmetric(horizontal: 10, vertical: 4);
  static const EdgeInsets containerMargin =
      EdgeInsets.symmetric(horizontal: 12);
}
