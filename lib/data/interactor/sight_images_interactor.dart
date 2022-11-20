import 'dart:io';
import 'package:flutter/material.dart';
import 'package:places/data/repository/sight_images_repository.dart';

class SightImagesInteractor {
  SightImagesInteractor(this.repository);

  static SightImagesInteractor instance = SightImagesInteractor(
    SightImagesRepository.instance,
  );

  final SightImagesRepository repository;

  Future<Image> getImageFrom({
    required String url,
    BoxFit fit = BoxFit.cover,
  }) async {
    final File? repoFile = await repository.getImage(url);
    return repoFile != null ? Image.file(repoFile, fit: fit) : noImage();
  }

  Image? getImageSync({
    required String url,
    BoxFit fit = BoxFit.cover,
  }) {
    File? file = SightImagesRepository.instance.getImageSync(url);
    if (file != null) {
      return Image.file(file, fit: fit);
    } else
      return null;
  }

  Image noImage() {
    final assetPath = 'assets/images/image_not_found.png';
    return Image.asset(
      assetPath,
      fit: BoxFit.contain,
    );
  }
}
