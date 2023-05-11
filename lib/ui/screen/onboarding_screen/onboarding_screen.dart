import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/onboard_page_pagination.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';
import 'onboarding_screen_wm.dart';

@RoutePage()
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = onboardingScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);


  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: wm.pageController,
              onPageChanged: wm.onPageChanged,
              children: wm.onboardingPages,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ValueListenableBuilder<int>(
                  valueListenable: wm.currentPage,
                  builder: (_, currentPage, __) {
                    return OnboardPagePagination(
                      wm.onboardingPages.length,
                      currentPage,
                    );
                  },
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: wm.showToStartBtn,
              builder: (_, isShowing, __) {
                return AnimatedOpacity(
                  opacity: isShowing ? 1.0 : 0.0,
                  duration: wm.showBtnAnimateDuration,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LargeAppButton(
                        onPressed: wm.onStartBtnPressed,
                        titleWidgets: [
                          Text(
                            AppStrings.letsGo.toUpperCase(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: wm.showSkipBtn,
              builder: (_, isShowSkipBtn, __) {
                return AnimatedOpacity(
                  opacity: isShowSkipBtn ? 1.0 : 0.0,
                  duration: wm.showBtnAnimateDuration,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextButton(
                        onPressed: wm.onSkipBtnPressed,
                        child: Text(
                          AppStrings.skip,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
