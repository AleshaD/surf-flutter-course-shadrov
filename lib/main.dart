import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/mocks.dart';
import 'package:places/res/themes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

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
  final mockNumber = 3;

  ThemeData _currentTheme = lightTheme;

  void changeTheme(bool toDarkTheme) {
    setState(() {
      toDarkTheme ? _currentTheme = darkTheme : _currentTheme = lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: _currentTheme,
      home: SightDetailsScreen(sightMocks[mockNumber]),
    );
  }
}
