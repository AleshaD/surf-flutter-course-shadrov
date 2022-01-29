import 'package:flutter/material.dart';
import 'package:places/domain/searched_sight.dart';
import 'package:places/ui/widgets/network_image_with_progress.dart';

class SightCardTile extends StatelessWidget {
  const SightCardTile({
    required this.searched,
    required this.highliteStyle,
    required this.normalStyle,
    required this.showDevider,
    required this.onTap,
  });

  final TextStyle highliteStyle;
  final TextStyle normalStyle;
  final VoidCallback onTap;
  final SearchedSight searched;
  final bool showDevider;

  RichText nameWithHighlites() {
    Set<String> words = {};
    searched.query.split(' ').forEach(
          (word) => words.add(
            word.trim().toLowerCase(),
          ),
        );

    String name = searched.sight.name;
    String compareName = name.toLowerCase();
    List<RangeValues> higlitedRanges = [];
    List<TextSpan> children = [];

    // найдём диапазоны вложений слов в строке
    wordsloop:
    for (var i = 0; i < words.length; i++) {
      String word = words.elementAt(i);

      int startIndex = compareName.indexOf(word);
      int endIndex = startIndex + word.length;

      // исключаем пересечения в диапазонах
      for (var j = 0; j < higlitedRanges.length; j++) {
        RangeValues range = higlitedRanges[j];
        if (range.start <= startIndex && range.end >= startIndex) {
          if (range.end <= endIndex) {
            // расширяем диапазон
            higlitedRanges.removeAt(j);
            higlitedRanges.add(
              RangeValues(
                range.start,
                endIndex.toDouble(),
              ),
            );
            continue wordsloop;
          } else {
            // пропускаем слово, поскольку эта область уже будет подсвечена
            continue wordsloop;
          }
        }
      }

      higlitedRanges.add(
        RangeValues(
          startIndex.toDouble(),
          endIndex.toDouble(),
        ),
      );
    }

    higlitedRanges.sort((a, b) {
      return a.end.compareTo(b.end);
    });

    // формируем RichText
    for (var i = 0; i < higlitedRanges.length; i++) {
      var range = higlitedRanges[i];
      if (i == 0) {
        if (range.start != 0) {
          children.add(normalSpan(name.substring(0, range.start.toInt())));
        }
        children.add(higliteSpan(name.substring(range.start.toInt(), range.end.toInt())));
      } else {
        var prevRange = higlitedRanges[i - 1];
        children.add(normalSpan(name.substring(prevRange.end.toInt(), range.start.toInt())));
        children.add(higliteSpan(name.substring(range.start.toInt(), range.end.toInt())));
      }

      bool isLast = i == higlitedRanges.length - 1;
      if (isLast) children.add(normalSpan(name.substring(range.end.toInt(), name.length)));
    }

    return RichText(
      text: TextSpan(
        children: children,
      ),
    );
  }

  TextSpan higliteSpan(String txt) => TextSpan(text: txt, style: highliteStyle);

  TextSpan normalSpan(String txt) => TextSpan(text: txt, style: normalStyle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: searched.sight.url != ''
                  ? NetworkImageWithProgress(searched.sight.url)
                  : Container(
                      color: Colors.amber,
                    ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: InkWell(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  nameWithHighlites(),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    searched.sight.typeName,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  showDevider ? Divider() : Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
