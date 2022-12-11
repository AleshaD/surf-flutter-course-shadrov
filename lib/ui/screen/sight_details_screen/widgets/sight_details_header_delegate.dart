import 'package:flutter/material.dart';

class SightDetailsHeaderDelegate extends SliverPersistentHeaderDelegate {
  SightDetailsHeaderDelegate({required this.child});

  final Widget child;

  static const double maxHeight = 360;

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
