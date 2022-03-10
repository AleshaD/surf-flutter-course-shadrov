import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/add_photo_button.dart';
import 'package:places/ui/screen/add_sight_screen/added_photo.dart';

class AddSightPhotoList extends StatelessWidget {
  AddSightPhotoList({
    required this.imagePaths,
    required this.addNewPhotoPressed,
    required this.onDeletePhoto,
  });

  final List<String> imagePaths;
  final VoidCallback addNewPhotoPressed;
  final Function(String) onDeletePhoto;

  final cardSize = 72.0;

  final _borderRadius = BorderRadius.all(
    Radius.circular(12),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AddPhotoButton(
              borderRadius: _borderRadius,
              onTap: addNewPhotoPressed,
              btnSize: cardSize,
            ),
          ),
          ...imagePaths
              .map(
                (path) => Align(
                  alignment: Alignment.bottomCenter,
                  child: AddedPhoto(
                    photoPath: path,
                    photoSize: cardSize,
                    borderRadius: _borderRadius,
                    onDelete: () => onDeletePhoto(path),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
