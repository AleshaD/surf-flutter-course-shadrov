import 'package:flutter/material.dart';

class RoundedGradientButton extends StatelessWidget {
  RoundedGradientButton({
    required this.onPressed,
    required this.titleWidgets,
    this.borderRadiusVal = 24,
    this.height = 48,
    this.width = 180,
    this.elevation = 0,
  }) : this.borderRadius = BorderRadius.all(
          Radius.circular(borderRadiusVal),
        );

  final BorderRadius borderRadius;
  final double borderRadiusVal;
  final double height;
  final VoidCallback onPressed;
  final List<Widget> titleWidgets;
  final double width;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondaryContainer,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
          boxShadow: elevation == 0 ? [] : kElevationToShadow[elevation]),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: borderRadius,
                ),
              ),
            ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: titleWidgets,
          ),
        ),
      ),
    );
  }
}
