import 'package:flutter/material.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:provider/provider.dart';

class NetworkImageWithProgress extends StatefulWidget {
  ///Create Image.network and show CircularProgressIndicator while loading
  const NetworkImageWithProgress(this.url, {this.fit = BoxFit.cover});

  final BoxFit fit;
  final String url;

  @override
  State<NetworkImageWithProgress> createState() => _NetworkImageWithProgressState();
}

class _NetworkImageWithProgressState extends State<NetworkImageWithProgress> {
  @override
  Widget build(BuildContext context) {
    final Image? imageWidget =
        context.read<SightImagesInteractor>().getImageSync(url: widget.url);

    return imageWidget ??
        FutureBuilder(
          future: context.read<SightImagesInteractor>().getImageFrom(url: widget.url),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData ? snapshot.data as Image : SizedBox.shrink();
            } else {
              return SizedBox.shrink();
            }
          },
        );
  }
}
