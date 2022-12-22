import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';
import 'package:places/ui/widgets/photo_page_view/photo_page_pagination.dart';

class PhotoPageView extends StatefulWidget {
  const PhotoPageView({
    required this.photoUrls,
    this.height = 360,
    this.topCornerRadius = 0,
  });

  final double height;
  final List<String> photoUrls;
  final double topCornerRadius;

  @override
  _PhotoPageViewState createState() => _PhotoPageViewState();
}

class _PhotoPageViewState extends State<PhotoPageView> {
  double clipCornerRadius = 0;
  int currentPage = 0;
  final _pageChangeStreamCtrl = StreamController<int>();

  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    clipCornerRadius = widget.topCornerRadius;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            allowImplicitScrolling: true,
            itemCount: widget.photoUrls.length,
            onPageChanged: (value) => _pageChangeStreamCtrl.add(value),
            itemBuilder: (context, index) {
              return NetworkImageWithProgress(
                widget.photoUrls[index],
              );
            },
          ),
          widget.photoUrls.length > 1
              ? StreamBuilder<int>(
                  stream: _pageChangeStreamCtrl.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    final currentPage = snapshot.data!;
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: PhotoPagePagination(
                        pagesCount: widget.photoUrls.length,
                        currentPage: currentPage,
                      ),
                    );
                  },
                )
              : Container()
        ],
      ),
    );
  }
}
