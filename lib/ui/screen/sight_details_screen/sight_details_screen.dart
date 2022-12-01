import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/interactor/sight_images_interactor.dart';
import 'package:places/data/model/sights/sight.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_header_delegate.dart';
import 'package:places/ui/widgets/icon_text_button.dart';
import 'package:places/ui/widgets/buttons/large_app_button.dart';
import 'package:places/ui/widgets/photo_page_view/photo_page_view.dart';
import 'package:provider/provider.dart';

import '../../../blocs/visiting_bloc/visiting_bloc.dart';
import '../../widgets/pickers.dart';

class SightDetailsScreen extends StatelessWidget {
  SightDetailsScreen(
    this.sight,
    this.scrollController, {
    this.topCornersRadius = 0,
    required this.visitingBloc,
  });

  final Sight sight;
  final ScrollController scrollController;
  final double topCornersRadius;
  final VisitingBloc visitingBloc;
  final BorderRadius _backBtnRadius = BorderRadius.circular(
    40,
  );

  static void showInBottomSheet(Sight sight, VisitingBloc visitingBloc, BuildContext context) {
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
                return SightDetailsScreen(
                  sight,
                  scrollController,
                  topCornersRadius: topCornerRadius,
                  visitingBloc: visitingBloc,
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double childMargin = 24;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                      ? PhotoPageView(
                          photoUrls: sight.urls,
                          height: SightDetailsHeaderDelegate.maxHeight,
                          topCornerRadius: topCornersRadius,
                        )
                      : Center(
                          child:
                              Provider.of<SightImagesInteractor>(context, listen: false).noImage(),
                        ),
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
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              CustomIcons.close,
                              size: 25,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 4,
                      width: 40,
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
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
                        sight.description,
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
                            isActive: true,
                            onPressed: () async {
                              DateTime? dateTime = await Pickers.pickDateAndTime(context);
                              if (dateTime != null) {
                                visitingBloc.add(
                                  VisitingEvent.addWantToVisitTime(
                                    sight: sight,
                                    date: dateTime,
                                  ),
                                );
                              }
                            },
                          ),
                          BlocBuilder<VisitingBloc, VisitingState>(
                            builder: (context, state) {
                              bool isInWantToVisit = false;
                              if (state.withSights) {
                                try {
                                  state.wantToVisitSights.firstWhere((s) => s.id == sight.id);
                                  isInWantToVisit = true;
                                } catch (e) {
                                  // нет элемента в списке, это номально
                                }
                              }
                              return IconTextButton(
                                icon: isInWantToVisit
                                    ? CustomIcons.menu_heart_full
                                    : CustomIcons.menu_heart,
                                name: isInWantToVisit
                                    ? AppStrings.deleteFromFavorite
                                    : AppStrings.toFavorite,
                                isActive: true,
                                onPressed: () {
                                  isInWantToVisit
                                      ? context
                                          .read<VisitingBloc>()
                                          .add(VisitingEvent.deleteFromWantToVisit(sight: sight))
                                      : context
                                          .read<VisitingBloc>()
                                          .add(VisitingEvent.addToWantToVisit(sight: sight));
                                },
                              );
                            },
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
