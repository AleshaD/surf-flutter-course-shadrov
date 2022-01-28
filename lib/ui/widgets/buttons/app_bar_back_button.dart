import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 18,
      onPressed: Navigator.of(context).pop,
      icon: Icon(
        CustomIcons.arrow_back,
        size: 14,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
