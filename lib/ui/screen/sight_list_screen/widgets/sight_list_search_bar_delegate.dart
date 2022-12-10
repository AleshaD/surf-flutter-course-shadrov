import 'package:flutter/material.dart';

class SightListSearchBarDelegate extends SliverPersistentHeaderDelegate {
  SightListSearchBarDelegate({required this.child});

  final Widget child;
  final double height = 52;

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
