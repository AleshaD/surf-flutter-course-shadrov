import 'package:flutter/material.dart';
import 'package:places/ui/styles/custom_icons.dart';

class AddPhotoButton extends StatelessWidget {
  const AddPhotoButton({
    required this.borderRadius,
    required this.onTap,
    required this.btnSize,
  });

  final BorderRadius borderRadius;
  final VoidCallback onTap;
  final double btnSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(
          Size(btnSize, btnSize),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: borderRadius,
          ),
          child: Icon(
            CustomIcons.plus,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
