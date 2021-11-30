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
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: Color(0xff252849),
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
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: secondaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Text(
                        sight.type,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'закрыто до 09:00',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7C7E92),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: childMargin),
                Text(
                  sight.details,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondaryColor,
                      height: 1.2),
                ),
                SizedBox(height: childMargin),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Color(0xff4caf50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.moving_sharp,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: childMargin),
                Container(
                  height: 0.8,
                  color: Color.fromRGBO(124, 126, 146, 0.24),
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
                    )
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
