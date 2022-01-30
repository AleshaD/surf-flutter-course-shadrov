import 'package:flutter/material.dart';

class SuffixButton extends StatelessWidget {
  const SuffixButton({
    required this.onPressed,
    required this.iconData,
    this.iconColor,
  });

  final Color? iconColor;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        padding: EdgeInsets.all(0),
        splashRadius: 16,
        iconSize: 20,
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 20,
          color: iconColor ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
