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
  Image? imageWidget;
  CrossFadeState animatedState = CrossFadeState.showFirst;
  final loadingState = CrossFadeState.showFirst;
  final imageState = CrossFadeState.showSecond;

  @override
  void initState() {
    super.initState();
    imageWidget = context.read<SightImagesInteractor>().getImageSync(
          url: widget.url,
        );
    if (imageWidget == null) {
      animatedState = loadingState;
      Future.delayed(Duration.zero, _loadImage);
    } else {
      animatedState = imageState;
    }
  }

  void _loadImage() async {
    imageWidget = await context.read<SightImagesInteractor>().getImageFrom(
          url: widget.url,
        );
    setState(() {
      animatedState = imageState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 500),
      crossFadeState: animatedState,
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              key: bottomChildKey,
              child: bottomChild,
            ),
            Positioned.fill(
              key: topChildKey,
              child: topChild,
            ),
          ],
        );
      },
      firstChild: Center(
        child: CircularProgressIndicator(),
      ),
      secondChild: imageWidget ?? SizedBox.shrink(),
    );
  }
}
