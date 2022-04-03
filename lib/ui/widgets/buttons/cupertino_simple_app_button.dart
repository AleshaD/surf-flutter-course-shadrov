import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSimpleAppButton extends StatelessWidget {
  const CupertinoSimpleAppButton(
    this.name, {
    required this.onPressed,
  });
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 60,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      onPressed: onPressed,
      child: Text(
        name,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
    );
  }
}
