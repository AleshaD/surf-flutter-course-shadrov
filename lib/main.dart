import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/Sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final mockNumber = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SightListScreen(),
    );
  }
}
