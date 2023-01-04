import 'dart:math' as Math;

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/data/repository/settings_repository.dart';
import 'package:places/ui/screen/home_screen.dart/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen_widget.dart';
import 'package:places/util/default_error_handler.dart';
import 'package:places/util/elementary_single_ticker_provider.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
import 'splash_screen_widget.dart';

abstract class ISplashScreenWidgetModel extends IWidgetModel {
  ThemeData get theme;
  AnimationController get logoAnimationCtrl;
  Animation<double> get rotateAnimation;

  double degreeToRadian(double degree);
}

SplashScreenWidgetModel defaultSplashScreenWidgetModelFactory(BuildContext context) {
  return SplashScreenWidgetModel(
    SplashScreenModel(
      context.read<DefaultErrorHandler>(),
      context.read<SettingsRepository>(),
    ),
  );
}

class SplashScreenWidgetModel extends WidgetModel<SplashScreenWidget, SplashScreenModel>
    with ElementarySingleTickerProvider
    implements ISplashScreenWidgetModel {
  SplashScreenWidgetModel(SplashScreenModel model) : super(model);

  final double centerCircleSize = 160;
  final int rotateInMs = 1500;
  late final AnimationController _logoAnimationCtrl;
  late final Animation<double> _rotateAnimation;

  @override
  AnimationController get logoAnimationCtrl => _logoAnimationCtrl;

  @override
  Animation<double> get rotateAnimation => _rotateAnimation;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  double degreeToRadian(double degree) => degree * Math.pi / 180;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
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
    _goToAppAfterDelay();
  }

  @override
  void dispose() {
    _logoAnimationCtrl.dispose();
    super.dispose();
  }

  void _goToAppAfterDelay() {
    Future.delayed(Duration(milliseconds: rotateInMs * 1 + 500), () {
      final destination =
          model.isWatchedOnboarding() ? HomeScreen() : OnboardingScreenWidget();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    });
  }
}
