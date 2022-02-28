import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';

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
      child: Container(
        height: btnSize,
        width: btnSize,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Icon(
            CustomIcons.plus,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
