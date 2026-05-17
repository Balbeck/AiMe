import 'package:flutter/material.dart';
import 'navbar_button_style.dart';

class NavbarButton extends StatelessWidget {
  final IconData icon;
  final String routePath;
  final double size;
  final GlobalKey<NavigatorState> navigatorKey;

  const NavbarButton({
    super.key,
    required this.icon,
    required this.routePath,
    required this.size,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          navigatorKey.currentState?.pushReplacementNamed(routePath),
      child: Container(
        width: size,
        height: size,
        decoration: NavbarButtonStyle.decoration,
        child: Center(
          child: Icon(
            icon,
            size: NavbarButtonStyle.iconSize,
            color: NavbarButtonStyle.iconColor,
          ),
        ),
      ),
    );
  }
}
