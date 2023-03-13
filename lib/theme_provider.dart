import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDartMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark(),
      textTheme: const TextTheme(headline1: TextStyle(color: Colors.yellow)),
      primaryColor: Colors.black);
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.orange),
      colorScheme: const ColorScheme.light(),
      textTheme: const TextTheme(headline1: TextStyle(color: Colors.red)),
      primaryColor: Colors.white);
}

