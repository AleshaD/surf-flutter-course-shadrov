import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_header_delegate.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';
import 'package:places/ui/widgets/icon_text_button.dart';
import 'package:places/ui/widgets/photo_page_view/photo_page_view.dart';
import 'sight_details_screen_wm.dart';

class SightDetailsScreenWidget extends ElementaryWidget<ISightDetailsScreenWidgetModel> {
  SightDetailsScreenWidget({
    required this.sight,
    this.topCornersRadius = 0,
    this.showBottomSheetNav = false,
    this.scrollController,
    Key? key,
    WidgetModelFactory wmFactory = defaultSightDetailsScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final Sight sight;
  final double topCornersRadius;
  final bool showBottomSheetNav;
  final ScrollController? scrollController;

  final BorderRadius _backBtnRadius = BorderRadius.circular(
    40,
  );

  static void showInBottomSheet(Sight sight, BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double bottomSheetHeight = deviceHeight - 64;
    double topCornerRadius = 12;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(
            Size(bottomSheetHeight, bottomSheetHeight),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(topCornerRadius),
            ),
            child: DraggableScrollableSheet(
              initialChildSize: 1.0,
              minChildSize: 0.8,
              snap: true,
              builder: (_, scrollController) {
                return SightDetailsScreenWidget(
                  sight: sight,
                  scrollController: scrollController,
                  topCornersRadius: topCornerRadius,
                  showBottomSheetNav: true,
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(ISightDetailsScreenWidgetModel wm) {
    double childMargin = 24;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: wm.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(topCornersRadius),
        ),
      ),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            delegate: SightDetailsHeaderDelegate(
              child: Stack(
                children: [
                  sight.urls.isNotEmpty
                      ? Hero(
                          tag: sight.id,
                          child: PhotoPageView(
                            photoUrls: sight.urls,
                            height: SightDetailsHeaderDelegate.maxHeight,
                            topCornerRadius: topCornersRadius,
                          ),
                        )
                      : Hero(
                          tag: sight.id,
                          child: Center(
                            child: wm.noImage,
                          ),
                        ),
                  if (showBottomSheetNav)
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(top: 16, right: 16),
                        child: Center(
                          child: Material(
                            borderRadius: _backBtnRadius,
                            child: IconButton(
                              splashRadius: 20,
                              onPressed: wm.backBtnPressed,
                              icon: Icon(
                                CustomIcons.close,
                                size: 25,
                                color: wm.theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (showBottomSheetNav)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 4,
                        width: 40,
                        margin: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          color: wm.theme.colorScheme.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  if (!showBottomSheetNav)
                    Hero(
                      tag: '${sight.idStr}_backbtn',
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(top: 56, left: 16),
                          child: Center(
                            child: Material(
                              borderRadius: _backBtnRadius,
                              child: IconButton(
                                splashRadius: 20,
                                onPressed: wm.backBtnPressed,
                                icon: Icon(
                                  CustomIcons.arrow_back,
                                  size: 16,
                                  color: wm.theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: childMargin),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sight.name,
                        style: wm.theme.textTheme.headline5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Row(
                          children: [
                            Text(
                              sight.typeName.toLowerCase(),
                              style: wm.theme.primaryTextTheme.subtitle1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                wm.closeUntilTime,
                                style: wm.theme.textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: childMargin),
                      Text(
                        sight.description,
                        style: wm.theme.primaryTextTheme.subtitle2,
                      ),
                      SizedBox(height: childMargin),
                      LargeAppButton(
                        onPressed: wm.createRoutePressed,
                        titleWidgets: [
                          Icon(
                            CustomIcons.go,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              AppStrings.createRout.toUpperCase(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: childMargin),
                      Divider(
                        height: 0.8,
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconTextButton(
                            icon: CustomIcons.calendar,
                            name: AppStrings.plan,
                            isActive: true,
                            onPressed: wm.addTimeToVisitPressed,
                          ),
                          StateNotifierBuilder<bool>(
                            listenableState: wm.isInWantToVisit,
                            builder: ((_, isInWantToVisitList) {
                              return AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                child: IconTextButton(
                                  key: UniqueKey(),
                                  icon: isInWantToVisitList!
                                      ? CustomIcons.menu_heart_full
                                      : CustomIcons.menu_heart,
                                  name: isInWantToVisitList
                                      ? AppStrings.deleteFromFavorite
                                      : AppStrings.toFavorite,
                                  isActive: true,
                                  onPressed: wm.onHeartBtnPressed,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: childMargin,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
