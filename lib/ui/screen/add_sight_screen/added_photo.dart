import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/suffix_button.dart';

class AddedPhoto extends StatelessWidget {
  const AddedPhoto({
    required this.photoPath,
    required this.photoSize,
    required this.borderRadius,
    required this.onDelete,
  });

  final String photoPath;
  final double photoSize;
  final BorderRadius borderRadius;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => onDelete(),
      direction: DismissDirection.up,
      child: Container(
        width: photoSize,
        height: photoSize,
        margin: EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: DecorationImage(image: AssetImage(photoPath), fit: BoxFit.cover),
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
