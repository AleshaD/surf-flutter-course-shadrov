import 'package:flutter/material.dart';

class LargeAppButton extends StatelessWidget {
  const LargeAppButton({
    required this.onPressed,
    required this.titleWidgets,
    this.borderRadius = 12,
    this.height = 48,
    this.isActive = true,
  });

  final double borderRadius;
  final double height;
  final bool isActive;
  final void Function() onPressed;
  final List<Widget> titleWidgets;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? onPressed : null,
      child: Container(
        height: height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleWidgets,
        ),
      ),
    );
  }
}
