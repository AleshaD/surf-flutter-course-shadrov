import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/home_screen.dart/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboard_page_pagination.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_page.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final _showBtnDuration = Duration(milliseconds: 150);
  final _pageController = PageController();

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
  Widget build(BuildContext context) {
    bool showToStartBtn = _currentPage == _onboardingPages.length - 1;
    bool showSkipBtn = !showToStartBtn;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                _currentPage = value;
              }),
              children: _onboardingPages,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: OnboardPagePagination(
                  _onboardingPages.length,
                  _currentPage,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: showToStartBtn ? 1.0 : 0.0,
              duration: _showBtnDuration,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: LargeAppButton(
                    onPressed: () {
                      if (showToStartBtn)
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                    },
                    titleWidgets: [
                      Text(
                        AppStrings.letsGo.toUpperCase(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: showSkipBtn ? 1.0 : 0.0,
              duration: _showBtnDuration,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextButton(
                    onPressed: () {
                      if (showSkipBtn)
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 350),
                          curve: Curves.easeOut,
                        );
                    },
                    child: Text(
                      AppStrings.skip,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
