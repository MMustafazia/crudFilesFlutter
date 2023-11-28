import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  ThemeNotifier() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    _currentTheme = isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  Future<void> toggleLightTheme() async {
    _currentTheme = ThemeData.light();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', false);
  }

  Future<void> toggleDarkTheme() async {
    _currentTheme = ThemeData.dark();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', true);
  }
}
