import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          backgroundColor: Colors.red,
          appBarTheme: AppBarTheme(color: Colors.indigo),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.blue[100]),
            headline3: TextStyle(
              color: Colors.blue[600],
            ),
            subtitle1: TextStyle(
              color: Colors.white70,
            ),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          backgroundColor: Colors.red,
          appBarTheme: AppBarTheme(color: Colors.black87),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white54),
            headline3: TextStyle(
              color: Colors.blue[600],
            ),
            subtitle1: TextStyle(
              color: Colors.white70,
            ),
          ),
        );
      case ThemeType.Joy:
        return ThemeData(
          backgroundColor: Colors.red,
          appBarTheme: AppBarTheme(color: Colors.green[400]),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white70),
            headline3: TextStyle(
              color: Colors.green[400]!,
            ),
            subtitle1: TextStyle(
              color: Colors.black87,
            ),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Joy,
}
