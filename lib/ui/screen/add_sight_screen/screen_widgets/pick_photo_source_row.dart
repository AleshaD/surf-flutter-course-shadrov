import 'package:flutter/material.dart';

class PickPhotoSourceRow extends StatelessWidget {
  const PickPhotoSourceRow(
    this.icon,
    this.name,
    this.onTap,
  );

  final IconData icon;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Icon(
                icon,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              SizedBox(
                width: 13,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
