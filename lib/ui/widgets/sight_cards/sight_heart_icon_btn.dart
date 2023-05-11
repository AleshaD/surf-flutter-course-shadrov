import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_bloc/visiting_bloc.dart';
import 'package:places/ui/widgets/sight_cards/sight_card_icon_button.dart';
import '../../../data/model/sights/sight.dart';
import '../../styles/custom_icons.dart';

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
  bool isInWantToVisit = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitingBloc, VisitingState>(
      buildWhen: (previous, current) {
        final isSightInCurrentList = current.isSightInWantToVisitList(widget.sight);

        return isInWantToVisit != isSightInCurrentList;
      },
      builder: (context, state) {
        isInWantToVisit = state.isSightInWantToVisitList(widget.sight);
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: SightCardIconButton(
            key: UniqueKey(),
            icon: isInWantToVisit ? CustomIcons.menu_heart_full : CustomIcons.menu_heart,
            iconSize: widget.iconSize,
            iconColor: widget.iconColor,
            onPressed: (context) {
              if (!isInWantToVisit)
                context.read<VisitingBloc>().add(
                      VisitingEvent.addToWantToVisit(sight: widget.sight),
                    );
              else
                context.read<VisitingBloc>().add(
                      VisitingEvent.deleteFromWantToVisit(sight: widget.sight),
                    );
            },
          ),
        );
      },
    );
  }
}
