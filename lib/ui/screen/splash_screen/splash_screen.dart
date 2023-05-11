import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'splash_screen_wm.dart';

@RoutePage()
class SplashScreen extends ElementaryWidget<ISplashScreenWidgetModel> {
  const SplashScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultSplashScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISplashScreenWidgetModel wm) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-2.28, -1),
          end: Alignment.topRight,
          colors: wm.pageGradient,
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: wm.logoAnimationCtrl,
          builder: (context, child) {
            final degree = wm.rotateAnimation.value;
            return Transform.rotate(
              angle: wm.degreeToRadian(degree) * -1,
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
