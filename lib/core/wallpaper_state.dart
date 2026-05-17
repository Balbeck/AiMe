import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WallpaperState {
  static const String _defaultPath =
      'lib/background_wallpapers/Pacific_Wallpaper_.jpg';
  static const String _prefKey = 'selected_wallpaper';

  static final ValueNotifier<String> current = ValueNotifier(_defaultPath);

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefKey);
    if (saved != null) current.value = saved;
  }

  static Future<void> select(String path) async {
    current.value = path;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, path);
  }
}
