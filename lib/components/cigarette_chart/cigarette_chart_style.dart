import 'package:flutter/material.dart';

abstract class CigaretteChartStyle {
  static const Color chartBackground = Color(0xEE1A1A2E);
  static const BorderRadius chartRadius = BorderRadius.all(Radius.circular(16));
  static const EdgeInsets chartMargin =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const EdgeInsets chartPadding =
      EdgeInsets.only(top: 16, right: 24, bottom: 8, left: 4);
  static const EdgeInsets legendPadding =
      EdgeInsets.symmetric(horizontal: 8, vertical: 8);

  // Line colors
  static const Color cigHourlyColor = Color(0xFFFF6D00);
  static const Color cigCumulColor = Color(0xFFAB47BC);
  static const Color cbdHourlyColor = Color(0xFF66BB6A);
  static const Color cbdCumulColor = Color(0xFF42A5F5);

  static const double lineWidth = 2.5;
  static const double dotRadius = 4.0;

  // Axis
  static const TextStyle axisLabelStyle = TextStyle(
    fontSize: 10,
    color: Colors.white70,
  );

  // Legend
  static const double legendDotSize = 10.0;
  static const TextStyle legendTextStyle = TextStyle(
    fontSize: 11,
    color: Colors.white,
  );
  static const double legendItemSpacing = 6.0;
  static const double legendDotLabelGap = 4.0;

  // Labels
  static const String labelCigPerHour = 'Cig/h';
  static const String labelCigCumul = 'Cig cumul';
  static const String labelCbdPerHour = 'CBD/h';
  static const String labelCbdCumul = 'CBD cumul';

  // Empty state
  static const String emptyMessage = 'Aucune donnée aujourd\'hui';
  static const TextStyle emptyMessageStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
}
