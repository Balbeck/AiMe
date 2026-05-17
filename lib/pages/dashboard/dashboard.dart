import 'package:flutter/material.dart';
import 'dashboard_style.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(DashboardStyle.pageTitle),
    );
  }
}
