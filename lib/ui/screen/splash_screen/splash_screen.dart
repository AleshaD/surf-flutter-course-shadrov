import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final double centerCircleSize = 160;
  final int rotateInMs = 1500;
  late final AnimationController _logoAnimationCtrl;
  late final Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: rotateInMs * 3 + 500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OnboardingScreenWidget(),
        ),
      );
    });

    _logoAnimationCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: rotateInMs),
    );
    _logoAnimationCtrl.repeat();

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationCtrl,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _logoAnimationCtrl.dispose();
    super.dispose();
  }

  double _degreeToRadian(double degree) => degree * Math.pi / 180;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-2.28, -1),
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.secondaryContainer,
            Theme.of(context).colorScheme.secondary
          ],
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _logoAnimationCtrl,
          builder: (context, child) {
            final degree = _rotateAnimation.value;
            return Transform.rotate(
              angle: _degreeToRadian(degree) * -1,
              child: Icon(
                CustomIcons.spash_screen_logo,
                size: 160,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
