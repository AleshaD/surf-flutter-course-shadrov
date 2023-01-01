import 'package:flutter/material.dart';

class SightCardIconButton extends StatelessWidget {
  const SightCardIconButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final void Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      constraints: BoxConstraints(maxWidth: iconSize, minHeight: 48),
      splashRadius: iconSize,
      onPressed: () => onPressed(context),
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
