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

  final _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    clipCornerRadius = widget.topCornerRadius;
    _pageController.addListener(_straightenTopCornersWhenMoving);
  }

  void _straightenTopCornersWhenMoving() {
    bool pageOnMoving = _pageController.page! % 1 != 0;
    if (pageOnMoving && clipCornerRadius != 0) {
      setState(() {
        clipCornerRadius = 0;
      });
    }

    if (!pageOnMoving && clipCornerRadius != widget.topCornerRadius) {
      setState(() {
        clipCornerRadius = widget.topCornerRadius;
      });
    }
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
                    clipCornerRadius,
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
