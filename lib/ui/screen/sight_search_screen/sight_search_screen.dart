import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/widgets/buttons/app_bar_back_button.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(
          AppStrings.sightListScrAppBar,
        ),
      ),
      body: Container(
        child: Text('Hello sight serch screen'),
      ),
    );
  }
}
