import 'package:flutter/material.dart';
import 'top_bar_style.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const TopBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TopBarStyle.height,
      padding: TopBarStyle.buttonPadding,
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => scaffoldKey.currentState?.openDrawer(),
        child: Container(
          width: TopBarStyle.buttonSize,
          height: TopBarStyle.buttonSize,
          decoration: TopBarStyle.buttonDecoration,
          child: const Center(
            child: Icon(
              Icons.menu,
              size: TopBarStyle.iconSize,
              color: TopBarStyle.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
