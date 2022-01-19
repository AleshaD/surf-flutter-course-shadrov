import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/mocks.dart';
import 'package:places/res/themes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';

void main() {
  initializeDateFormatting();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final mockNumber = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: lightTheme,
      home: FiltersScreen(
        sights: sightMocks,
        myCoordinate: myCoordinateMock,
      ),
    );
  }
}
