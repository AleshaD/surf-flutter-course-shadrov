import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_header_delegate.dart';
import 'package:places/ui/widgets/icon_text_button.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';
import 'package:places/ui/widgets/photo_page_view/photo_page_view.dart';

class SightDetailsScreen extends StatelessWidget {
  const SightDetailsScreen(this.sight);

  final Sight sight;
  final BorderRadius _backBtnRadius = const BorderRadius.all(
    Radius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    double childMargin = 24;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SightDetailsHeaderDelegate(
              child: Stack(
                children: [
                  PhotoPageView(
                    photoUrls: sight.photoUrls,
                    height: SightDetailsHeaderDelegate.maxHeight,
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    margin: EdgeInsets.only(top: 52, left: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: _backBtnRadius,
                    ),
                    child: Center(
                      child: Material(
                        borderRadius: _backBtnRadius,
                        child: IconButton(
                          splashRadius: 18,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            CustomIcons.arrow_back,
                            size: 14,
                            color: Theme.of(context).colorScheme.onPrimary,
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
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Row(
                          children: [
                            Text(
                              sight.typeName.toLowerCase(),
                              style: Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                '${AppStrings.closeUntil.toLowerCase()} 09:00',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: childMargin),
                      Text(
                        sight.details,
                        style: Theme.of(context).primaryTextTheme.subtitle2,
                      ),
                      SizedBox(height: childMargin),
                      LargeAppButton(
                        onPressed: () => print('ПОСТРОИТЬ МАРШРУТ'),
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
                            isActive: false,
                            onPressed: () => print('Запланировать'),
                          ),
                          IconTextButton(
                            icon: CustomIcons.menu_heart,
                            name: AppStrings.toFavorite,
                            isActive: true,
                            onPressed: () => print('В избранное'),
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
