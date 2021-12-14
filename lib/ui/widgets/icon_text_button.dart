import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool isActive;
  const IconTextButton({
    required this.icon,
    required this.name,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isActive
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSurface;

    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Text(
            name,
            style: Theme.of(context).textTheme.subtitle2!.apply(
                  color: color,
                ),
          ),
        ),
      ],
    );
  }
}
