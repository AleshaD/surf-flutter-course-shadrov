import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  final double cornerRadius = 12;
  const SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            // Виджет под фотографию
            height: 96,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(cornerRadius), topRight: Radius.circular(cornerRadius)),
                color: Colors.amber),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                sight.type,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 18, top: 12),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              )),
        ],
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(cornerRadius), bottomRight: Radius.circular(cornerRadius))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                sight.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                'краткое описание',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff7C7E92)),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
