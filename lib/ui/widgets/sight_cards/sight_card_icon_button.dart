import 'package:flutter/material.dart';

class SightCardIconButton extends StatelessWidget {
  const SightCardIconButton({
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.onPressed,
  });

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      splashRadius: iconSize,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
