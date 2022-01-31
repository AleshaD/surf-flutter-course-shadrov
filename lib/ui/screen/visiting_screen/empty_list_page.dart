import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';

class EmptyListPage extends StatelessWidget {
  const EmptyListPage({
    required this.icon,
    required this.bodyMessage,
    this.titleMessage = AppStrings.empty,
  });

  final IconData icon;
  final String bodyMessage;
  final String titleMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.onSurface,
            size: 50,
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            titleMessage,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Theme.of(context).colorScheme.onSurface),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            bodyMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .apply(color: Theme.of(context).colorScheme.onSurface),
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
