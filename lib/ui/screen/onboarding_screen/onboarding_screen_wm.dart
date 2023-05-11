import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/repository/settings_repository.dart';
import 'package:places/ui/router/app_router.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'onboarding_screen_model.dart';
import 'onboarding_screen.dart';

abstract class IOnboardingScreenWidgetModel extends IWidgetModel {
  List<OnboardingPage> get onboardingPages;
  PageController get pageController;
  ValueNotifier<bool> get showToStartBtn;
  ValueNotifier<bool> get showSkipBtn;
  ValueNotifier<int> get currentPage;
  Duration get showBtnAnimateDuration;

  void onStartBtnPressed();
  void onSkipBtnPressed();
  void onPageChanged(int value);
}

OnboardingScreenWidgetModel onboardingScreenWidgetModelFactory(
    BuildContext context) {
  return OnboardingScreenWidgetModel(
    OnboardingScreenModel(
      context.read<SettingsRepository>(),
    ),
  );
}

/// Default widget model for OnboardingScreenWidget
class OnboardingScreenWidgetModel
    extends WidgetModel<OnboardingScreen, OnboardingScreenModel>
    implements IOnboardingScreenWidgetModel {
  OnboardingScreenWidgetModel(OnboardingScreenModel model) : super(model);

  ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  ValueNotifier<bool> _showToStartBtn = ValueNotifier<bool>(false);
  ValueNotifier<bool> _showSkipBtn = ValueNotifier<bool>(true);

  final _pageCtrl = PageController();

  final List<OnboardingPage> _onboardingPages = [
    OnboardingPage(
      iconData: CustomIcons.tutorial_signs,
      title: AppStrings.welcomeToApp,
      subtitle: AppStrings.findNewLocation,
    ),
    OnboardingPage(
      iconData: CustomIcons.tutorial_bag,
      title: AppStrings.createRouteAndGo,
      subtitle: AppStrings.fastGetGoal,
    ),
    OnboardingPage(
      iconData: CustomIcons.tutorial_click,
      title: AppStrings.addYourOwnPlace,
      subtitle: AppStrings.shareBestPlace,
    ),
  ];

  @override
  Duration get showBtnAnimateDuration => Duration(milliseconds: 150);

  @override
  List<OnboardingPage> get onboardingPages => _onboardingPages;

  @override
  PageController get pageController => _pageCtrl;

  @override
  ValueNotifier<int> get currentPage => _currentPage;

  @override
  ValueNotifier<bool> get showSkipBtn => _showSkipBtn;

  @override
  ValueNotifier<bool> get showToStartBtn => _showToStartBtn;

  @override
  void onPageChanged(newPageIndex) {
    _currentPage.value = newPageIndex;
    final bool isEndPage = _currentPage.value == _onboardingPages.length - 1;
    _showToStartBtn.value = isEndPage;
    _showSkipBtn.value = !isEndPage;
  }

  @override
  void onSkipBtnPressed() {
    _pageCtrl.nextPage(
      duration: Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  @override
  void onStartBtnPressed() => context.replaceRoute(HomeRoute());

  @override
  void dispose() {
    model.setWatchedOnboarding();
    super.dispose();
  }
}
