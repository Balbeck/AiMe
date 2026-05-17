import 'package:flutter/material.dart';
import '../bottom_navbar/bottom_navbar.dart';
import 'params_drawer_style.dart';

class ParamsDrawer extends StatelessWidget {
  final List<NavbarButtonConfig> items;
  final GlobalKey<NavigatorState> navigatorKey;

  const ParamsDrawer({
    super.key,
    required this.items,
    required this.navigatorKey,
  });

  void _navigate(BuildContext context, String routePath) {
    Scaffold.of(context).closeDrawer();
    navigatorKey.currentState?.pushReplacementNamed(routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * ParamsDrawerStyle.widthFraction,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: ParamsDrawerStyle.headerSpacing),
          for (final item in items)
            ListTile(
              title: Text(item.label, style: ParamsDrawerStyle.itemTextStyle),
              onTap: () => _navigate(context, item.routePath),
            ),
        ],
      ),
    );
  }
}
