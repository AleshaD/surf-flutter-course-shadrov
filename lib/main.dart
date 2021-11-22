import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/Sight_details.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final mockNumber = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SightDetails(sightMocks[mockNumber]),
    );
  }
}
