import 'package:flutter/material.dart';
import 'components/bottom_navbar/bottom_navbar.dart';
import 'components/params_drawer/params_drawer.dart';
import 'components/top_bar/top_bar.dart';
import 'core/database/app_database.dart';
import 'core/wallpaper_state.dart';
import 'routes/routes.dart' show generateRoute;
import 'pages/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WallpaperState.load();
  AppDatabase.instance; // init DB au launch
  runApp(const AiMeApp());
}

class AiMeApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  const AiMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiMe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      navigatorKey: AiMeApp.navigatorKey,
      initialRoute: HomePage.routeName,
      onGenerateRoute: generateRoute,
      builder: (context, child) {
        return Scaffold(
          key: AiMeApp.scaffoldKey,
          drawer: ParamsDrawer(
            items: BottomNavbar.items,
            navigatorKey: AiMeApp.navigatorKey,
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              ValueListenableBuilder<String>(
                valueListenable: WallpaperState.current,
                builder: (context, path, _) => Image.asset(
                  path,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              if (child != null) Positioned.fill(child: child),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: TopBar(scaffoldKey: AiMeApp.scaffoldKey),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavbar(navigatorKey: AiMeApp.navigatorKey),
              ),
            ],
          ),
        );
      },
    );
  }
}
