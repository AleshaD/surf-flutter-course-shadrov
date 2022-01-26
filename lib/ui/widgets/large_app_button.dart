import 'package:flutter/material.dart';

class LargeAppButton extends StatelessWidget {
  const LargeAppButton({
    borderRadius,
    height,
    required this.onPressed,
    required this.titleWidgets,
  })  : this.height = height ?? 48,
        this.borderRadius = borderRadius ?? 12;

  final double borderRadius;
  final double height;
  final void Function() onPressed;
  final List<Widget> titleWidgets;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      color: Theme.of(context).colorScheme.secondary,
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        onTap: onPressed,
        child: Container(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: titleWidgets,
          ),
        ),
      ),
    );
  }
}
