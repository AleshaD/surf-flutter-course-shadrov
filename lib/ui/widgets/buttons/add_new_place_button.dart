import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/rounded_gradient_button.dart';

class AddNewPlaceButton extends StatelessWidget {
  const AddNewPlaceButton({
    Key? key,
    required this.onPressed,
    this.elevation = 0,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return RoundedGradientButton(
      onPressed: onPressed,
      elevation: elevation,
      titleWidgets: [
        Icon(
          CustomIcons.plus,
          size: 16,
          color: Theme.of(context).textTheme.button!.color,
        ),
        SizedBox(
          width: 14,
        ),
        Text(
          AppStrings.newPlace.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      ],
    );
  }
}
