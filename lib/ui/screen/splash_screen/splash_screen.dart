import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double centerCircleSize = 160;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SightListScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-2.28, -1),
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.secondaryVariant,
            Theme.of(context).colorScheme.secondary
          ],
        ),
      ),
      child: Center(
        child: Icon(
          CustomIcons.spash_screen_logo,
          size: 160,
          color: Colors.white, // Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}