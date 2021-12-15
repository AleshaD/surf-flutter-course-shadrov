import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/icon_text_button.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';

class SightDetails extends StatelessWidget {
  const SightDetails(this.sight);

  static const Color secondaryColor = Color(0xff3B3E5B); //временно, пока стилизацию не прошли

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    double childMargin = 24;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 360,
                width: double.infinity,
                child: NetworkImageWithProgress(sight.url),
              ),
              Container(
                height: 32,
                width: 32,
                margin: EdgeInsets.only(top: 36, left: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
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
                        sight.type,
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'закрыто до 09:00',
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
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.moving_sharp,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      icon: Icons.calendar_today,
                      name: 'Запланировать',
                      isActive: false,
                    ),
                    IconTextButton(
                      icon: Icons.favorite_border,
                      name: 'В Избранное',
                      isActive: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
