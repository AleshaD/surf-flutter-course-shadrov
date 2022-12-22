import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    Key? key,
    required this.icon,
    required this.name,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final bool isActive;
  final String name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Color color = isActive
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onTap: onPressed,
      child: Row(
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
      ),
    );
  }
}
