import 'package:flutter/material.dart';

class NetworkImageWithProgress extends StatelessWidget {
  ///Create Image.network and show CircularProgressIndicator while loading
  const NetworkImageWithProgress(this.url, {this.fit = BoxFit.cover});

  final BoxFit fit;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
