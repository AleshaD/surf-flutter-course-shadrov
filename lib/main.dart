import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/res/app_theme_config.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:places/ui/screen/splash_screen/splash_screen.dart';

void main() {
  initializeDateFormatting();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final mockNumber = 8;

  AppThemeConfig _appThemeConfig = AppThemeConfig.light();

  void changeTheme(bool toDarkTheme) {
    setState(() {
      toDarkTheme
          ? _appThemeConfig = AppThemeConfig.dark()
          : _appThemeConfig = AppThemeConfig.light();
    });
  }

  AppThemeConfig get appThemeConfig => _appThemeConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: _appThemeConfig.data,
      home: SplashScreen(),
    );
  }
}
