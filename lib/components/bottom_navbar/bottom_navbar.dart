import 'package:flutter/material.dart';
import '../navbar_button/navbar_button.dart';
import 'bottom_navbar_style.dart';

class NavbarButtonConfig {
  final IconData icon;
  final String routePath;
  final String label;

  const NavbarButtonConfig({
    required this.icon,
    required this.routePath,
    required this.label,
  });
}

class BottomNavbar extends StatefulWidget {
  static const List<NavbarButtonConfig> items = <NavbarButtonConfig>[
    NavbarButtonConfig(
      icon: Icons.home,
      routePath: '/home_page',
      label: 'Home',
    ),
    NavbarButtonConfig(
      icon: Icons.bar_chart,
      routePath: '/dashboard',
      label: 'Dashboard',
    ),
    NavbarButtonConfig(
      icon: Icons.thumb_up_alt_rounded,
      routePath: '/journeeplusoumoins',
      label: 'Journée',
    ),
    NavbarButtonConfig(
      icon: Icons.rocket_launch,
      routePath: '/goals',
      label: 'Goals',
    ),
    NavbarButtonConfig(
      icon: Icons.smoking_rooms,
      routePath: '/cigarette',
      label: 'Cigarette',
    ),
    NavbarButtonConfig(
      icon: Icons.calendar_month,
      routePath: '/calendrier',
      label: 'Calendrier',
    ),
    NavbarButtonConfig(
      icon: Icons.settings,
      routePath: '/parametres',
      label: 'Paramètres',
    ),
    NavbarButtonConfig(
      icon: Icons.person,
      routePath: '/profile',
      label: 'Profil',
    ),
  ];

  final GlobalKey<NavigatorState> navigatorKey;

  const BottomNavbar({super.key, required this.navigatorKey});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  ScrollController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null) {
      final screenWidth = MediaQuery.of(context).size.width;
      final itemWidth = screenWidth / 4;
      final initialIndex =
          BottomNavbar.items.length *
          (BottomNavbarStyle.virtualMultiplier ~/ 2);
      _controller = ScrollController(
        initialScrollOffset: initialIndex * itemWidth - itemWidth / 2,
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / 4;
    final buttonSize = itemWidth - BottomNavbarStyle.itemGap;
    final virtualCount =
        BottomNavbar.items.length * BottomNavbarStyle.virtualMultiplier;

    return Container(
      height: BottomNavbarStyle.height,
      decoration: BottomNavbarStyle.decoration,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: virtualCount,
        itemExtent: itemWidth,
        itemBuilder: (context, index) {
          final item = BottomNavbar.items[index % BottomNavbar.items.length];
          return Center(
            child: NavbarButton(
              icon: item.icon,
              routePath: item.routePath,
              size: buttonSize,
              navigatorKey: widget.navigatorKey,
            ),
          );
        },
      ),
    );
  }
}
