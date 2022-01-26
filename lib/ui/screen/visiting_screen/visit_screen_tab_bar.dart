import 'package:flutter/material.dart';

class VisitScreenTabBar extends StatelessWidget implements PreferredSizeWidget {
  const VisitScreenTabBar({required this.tabs});

  final List<Tab> tabs;
  final double horizontalMargin = 16;
  final double tabBarHeight = 40;

  @override
  Size get preferredSize => Size.fromHeight(tabBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tabBarHeight,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryVariant,
        borderRadius: BorderRadius.all(
          Radius.circular(tabBarHeight),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
          tabs: tabs,
        ),
      ),
    );
  }
}
