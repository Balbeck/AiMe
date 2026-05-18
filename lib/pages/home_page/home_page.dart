import 'package:flutter/material.dart';
import 'home_page_style.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(
          alignment: Alignment(0, -0.5),
          child: Text(
            HomePageStyle.bonjourText,
            style: HomePageStyle.greetingStyle,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            HomePageStyle.hectorText,
            style: HomePageStyle.greetingStyle,
          ),
        ),
      ],
    );
  }
}
