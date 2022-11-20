import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';

class NetworkImageWithProgress extends StatefulWidget {
  ///Create Image.network and show CircularProgressIndicator while loading
  const NetworkImageWithProgress(this.url, {this.fit = BoxFit.cover});

  final BoxFit fit;
  final String url;

  @override
  State<NetworkImageWithProgress> createState() => _NetworkImageWithProgressState();
}

class _NetworkImageWithProgressState extends State<NetworkImageWithProgress> {
  Widget? imageWidget;

  @override
  Widget build(BuildContext context) {
    return imageWidget ??
        FutureBuilder(
          future: SightImagesInteractor.instance.getImageFrom(url: widget.url),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                imageWidget = snapshot.data as Image;
                return imageWidget!;
              } else {
                return SizedBox.shrink();
              }
            } else {
              return SizedBox.shrink();
            }
          },
        );
  }
}
