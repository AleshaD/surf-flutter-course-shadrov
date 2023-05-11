import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/suffix_button.dart';

class AddedPhoto extends StatelessWidget {
  const AddedPhoto({
    required this.photoFile,
    required this.photoSize,
    required this.borderRadius,
    required this.onDelete,
  });

  final File photoFile;
  final double photoSize;
  final BorderRadius borderRadius;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.up,
      onDismissed: (direction) => onDelete(),
      child: Container(
        width: photoSize,
        height: photoSize,
        margin: EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: DecorationImage(
                  image: FileImage(photoFile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SuffixButton(
                onPressed: onDelete,
                iconData: CustomIcons.clear,
                iconColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
