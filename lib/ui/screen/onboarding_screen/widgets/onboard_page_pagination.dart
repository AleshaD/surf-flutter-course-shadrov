import 'package:flutter/material.dart';

class OnboardPagePagination extends StatelessWidget {
  const OnboardPagePagination(
    this.totalPages,
    this.currentPage,
  );

  final int currentPage;
  final double dotSize = 8;
  final int totalPages;

  Widget _dot(Color dotColor) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        Size(dotSize, dotSize),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dotSize),
          color: dotColor,
        ),
      ),
    );
  }

  Widget _currentPageDot(Color dotColor) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        Size(dotSize * 3, dotSize),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dotSize),
          color: dotColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < totalPages; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: i == currentPage
                ? _currentPageDot(Theme.of(context).colorScheme.secondary)
                : _dot(Theme.of(context).colorScheme.onSurface),
          )
      ],
    );
  }
}
