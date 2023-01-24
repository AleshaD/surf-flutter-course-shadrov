import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/screen_widgets/add_photo_button.dart';
import 'package:places/ui/screen/add_sight_screen/screen_widgets/added_photo.dart';

class AddSightPhotoList extends StatelessWidget {
  AddSightPhotoList({
    required this.imageFiles,
    required this.addNewPhotoPressed,
    required this.onDeletePhoto,
  });

  final List<File> imageFiles;
  final VoidCallback addNewPhotoPressed;
  final Function(File) onDeletePhoto;

  final cardSize = 72.0;

  final _borderRadius = BorderRadius.all(
    Radius.circular(12),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
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
          ...imageFiles.reversed
              .map(
                (file) => Align(
                  alignment: Alignment.bottomCenter,
                  child: AddedPhoto(
                    photoFile: file,
                    photoSize: cardSize,
                    borderRadius: _borderRadius,
                    onDelete: () => onDeletePhoto(file),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
