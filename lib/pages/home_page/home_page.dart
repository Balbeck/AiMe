import 'package:flutter/material.dart';
import 'home_page_style.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(HomePageStyle.pageTitle),
    );
  }
}
