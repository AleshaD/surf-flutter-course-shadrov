import 'package:flutter/material.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';
import 'package:places/ui/widgets/photo_page_view/photo_page_pagination.dart';

class PhotoPageView extends StatefulWidget {
  const PhotoPageView({
    required this.photoUrls,
    this.height = 360,
    this.topCornerRadius = 0,
  });

  final List<String> photoUrls;
  final double height;
  final double topCornerRadius;

  @override
  _PhotoPageViewState createState() => _PhotoPageViewState();
}

class _PhotoPageViewState extends State<PhotoPageView> {
  final _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
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
            onPageChanged: (value) => setState(() {
              currentPage = value;
            }),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    widget.topCornerRadius,
                  ),
                ),
                child: NetworkImageWithProgress(
                  widget.photoUrls[index],
                ),
              );
            },
          ),
          widget.photoUrls.length > 1
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: PhotoPagePagination(
                    pagesCount: widget.photoUrls.length,
                    currentPage: currentPage,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
