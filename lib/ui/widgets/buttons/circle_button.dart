import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.onTaped,
    required this.iconData,
    this.elevation = 0,
  }) : super(key: key);

  final VoidCallback onTaped;
  final IconData iconData;
  final double elevation;
  final double radius = 24.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
            shape: MaterialStatePropertyAll(CircleBorder()),
            elevation: MaterialStatePropertyAll(elevation),
          ),
      child: Icon(
        iconData,
        size: radius,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: onTaped,
    );
  }
}
