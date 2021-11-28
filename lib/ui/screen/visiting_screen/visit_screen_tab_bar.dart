import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_strings.dart';

class VisitScreenTabBar extends StatelessWidget implements PreferredSizeWidget {
  const VisitScreenTabBar();

  final double horizontalMargin = 16;
  final TextStyle labelStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
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
          color: AppColors.greyBackground,
          borderRadius: BorderRadius.all(Radius.circular(tabBarHeight))),
      child: TabBar(
        labelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        unselectedLabelColor: AppColors.inactiveBlack,
        indicator: ShapeDecoration.fromBoxDecoration(BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.all(Radius.circular(tabBarHeight)))),
        tabs: [
          Tab(text: AppStrings.wantToGo),
          Tab(text: AppStrings.visited),
        ],
      ),
    );
  }
}
