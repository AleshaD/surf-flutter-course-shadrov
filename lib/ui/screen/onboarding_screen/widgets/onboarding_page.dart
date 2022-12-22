import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  final IconData iconData;
  final String title;
  final String subtitle;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with SingleTickerProviderStateMixin {
  late final AnimationController _iconSizeAnimationCtrl;
  final double maxIconSize = 100;

  @override
  void initState() {
    super.initState();
    _iconSizeAnimationCtrl = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: maxIconSize,
      duration: Duration(milliseconds: 400),
    );

    Future.delayed(
      Duration.zero,
      () => _iconSizeAnimationCtrl.forward(from: 0),
    );
  }

  @override
  void dispose() {
    _iconSizeAnimationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 58),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: maxIconSize,
            child: AnimatedBuilder(
              animation: _iconSizeAnimationCtrl,
              builder: (_, __) => Icon(
                widget.iconData,
                size: _iconSizeAnimationCtrl.value,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
