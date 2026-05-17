import 'package:flutter/material.dart';

abstract class WallpaperPanelStyle {
  static const Color backgroundColor = Colors.black;
  static const Color backIconColor = Colors.white;
  static const double backIconSize = 28.0;
  static const EdgeInsets backButtonPadding =
      EdgeInsets.only(top: 48.0, left: 8.0);
  static const EdgeInsets gridPadding = EdgeInsets.all(12.0);
  static const int gridCrossAxisCount = 3;
  static const double gridSpacing = 8.0;
  static const double thumbnailAspectRatio = 9.0 / 16.0;
  static const double thumbnailRadius = 12.0;
  static const Color selectedBorderColor = Colors.white;
  static const double selectedBorderWidth = 3.0;
}
