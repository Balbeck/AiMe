import 'package:flutter/material.dart';
import '../pages/home_page/home_page.dart';
import '../pages/goals/goals.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/journee_plus_ou_moins/journee_plus_ou_moins.dart';
import '../pages/profile_page/profile_page.dart';
import '../pages/cigarette/cigarette.dart';
import '../pages/calendrier/calendrier.dart';
import '../pages/parametres/parametres.dart';

final Map<String, WidgetBuilder> _appRoutes = {
  HomePage.routeName: (_) => const HomePage(),
  GoalsPage.routeName: (_) => const GoalsPage(),
  DashboardPage.routeName: (_) => const DashboardPage(),
  JourneePlusOuMoinsPage.routeName: (_) => const JourneePlusOuMoinsPage(),
  ProfilePage.routeName: (_) => const ProfilePage(),
  CigarettePage.routeName: (_) => const CigarettePage(),
  CalendrierPage.routeName: (_) => const CalendrierPage(),
  ParametresPage.routeName: (_) => const ParametresPage(),
};

Route<dynamic> generateRoute(RouteSettings settings) {
  final builder = _appRoutes[settings.name] ?? (_) => const HomePage();
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, a1, a2) => builder(context),
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}
