import 'package:flutter/material.dart';

class PhotoPagePagination extends StatelessWidget {
  const PhotoPagePagination({
    required this.pagesCount,
    required this.currentPage,
  });

  final int pagesCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          for (var i = 0; i < pagesCount; i++)
            Expanded(
              child: Container(
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: i <= currentPage
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor.withAlpha(100),
                ),
              ),
            )
        ],
      ),
    );
  }
}
