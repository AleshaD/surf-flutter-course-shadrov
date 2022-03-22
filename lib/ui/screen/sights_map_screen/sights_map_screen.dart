import 'package:flutter/material.dart';

class SightsMapScreen extends StatelessWidget {
  const SightsMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Map',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
