import 'package:flutter/material.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';

import '../../../data/interactor/sight_interactor.dart';
import '../../../data/model/sights/sight.dart';
import '../../../styles/custom_icons.dart';

class SightHeartIconBtn extends StatefulWidget {
  const SightHeartIconBtn({
    Key? key,
    required this.iconSize,
    required this.iconColor,
    required this.sight,
  }) : super(key: key);

  final double iconSize;
  final Color iconColor;
  final Sight sight;

  @override
  _SightHeartIconBtnState createState() => _SightHeartIconBtnState();
}

class _SightHeartIconBtnState extends State<SightHeartIconBtn> {
  @override
  Widget build(BuildContext context) {
    bool alreadyInFavorite = SightInteractor.instance.isSightInFavorite(widget.sight);

    return SightCardIconButton(
      icon: alreadyInFavorite ? CustomIcons.menu_heart_full : CustomIcons.menu_heart,
      iconSize: widget.iconSize,
      iconColor: widget.iconColor,
      onPressed: (context) {
        setState(() {
          if (!alreadyInFavorite)
            SightInteractor.instance.addToFavorite(widget.sight);
          else
            SightInteractor.instance.removeFromFavorites(widget.sight);
        });
      },
    );
  }
}
