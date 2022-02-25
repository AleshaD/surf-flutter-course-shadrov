import 'package:flutter/material.dart';

class SightCardImitation extends StatelessWidget {
  SightCardImitation({
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(30),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
