import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/repository/sight_images_repository.dart';

class NetworkImageWithProgress extends StatefulWidget {
  ///Create Image.network and show CircularProgressIndicator while loading
  const NetworkImageWithProgress(this.url, {this.fit = BoxFit.cover});

  final BoxFit fit;
  final String url;

  @override
  State<NetworkImageWithProgress> createState() => _NetworkImageWithProgressState();
}

class _NetworkImageWithProgressState extends State<NetworkImageWithProgress> {
  final String noImageAsset = 'assets/images/image_not_found.jpeg';
  Widget? imageWidget;

  @override
  Widget build(BuildContext context) {
    return imageWidget ??
        FutureBuilder(
          future: SightImagesRepository.instance.getImage(widget.url),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final File? file = snapshot.data as File?;
                if (file != null) {
                  imageWidget = Image.file(file, fit: widget.fit);
                  return imageWidget!;
                } else {
                  imageWidget = Image.asset(noImageAsset, fit: widget.fit);
                  return imageWidget!;
                }
              } else {
                imageWidget = Image.asset(noImageAsset, fit: widget.fit);
                return imageWidget!;
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
  }
}
