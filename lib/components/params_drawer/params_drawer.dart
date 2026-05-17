import 'package:flutter/material.dart';
import '../bottom_navbar/bottom_navbar.dart';
import '../wallpaper_panel/wallpaper_panel.dart';
import 'params_drawer_style.dart';

class ParamsDrawer extends StatefulWidget {
  final List<NavbarButtonConfig> items;
  final GlobalKey<NavigatorState> navigatorKey;

  const ParamsDrawer({
    super.key,
    required this.items,
    required this.navigatorKey,
  });

  @override
  State<ParamsDrawer> createState() => _ParamsDrawerState();
}

class _ParamsDrawerState extends State<ParamsDrawer> {
  bool _showWallpaperPanel = false;

  void _navigate(BuildContext context, String routePath) {
    Scaffold.of(context).closeDrawer();
    widget.navigatorKey.currentState?.pushReplacementNamed(routePath);
  }

  @override
  Widget build(BuildContext context) {
    final drawerWidth =
        MediaQuery.of(context).size.width * ParamsDrawerStyle.widthFraction;

    if (_showWallpaperPanel) {
      return Drawer(
        width: drawerWidth,
        child: WallpaperPanel(
          onBack: () => setState(() => _showWallpaperPanel = false),
        ),
      );
    }

    return Drawer(
      width: drawerWidth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: ParamsDrawerStyle.headerSpacing),
          for (final item in widget.items)
            ListTile(
              title: Text(item.label, style: ParamsDrawerStyle.itemTextStyle),
              onTap: () => _navigate(context, item.routePath),
            ),
          ListTile(
            title: Text(
              ParamsDrawerStyle.wallpaperLabel,
              style: ParamsDrawerStyle.itemTextStyle,
            ),
            onTap: () => setState(() => _showWallpaperPanel = true),
          ),
        ],
      ),
    );
  }
}
