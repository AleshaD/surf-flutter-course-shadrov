import 'package:flutter/material.dart';
import 'package:places/ui/styles/custom_icons.dart';

class SearchHystoryTile extends StatelessWidget {
  const SearchHystoryTile({
    required this.name,
    required this.showDevider,
    required this.tileTaped,
    required this.onDelBtnPressed,
  });

  final String name;
  final bool showDevider;
  final VoidCallback onDelBtnPressed;
  final VoidCallback tileTaped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48,
          child: ListTile(
            onTap: tileTaped,
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0, right: 16),
            leading: Text(
              name,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 16,
                    height: 1,
                  ),
            ),
            trailing: IconButton(
              onPressed: onDelBtnPressed,
              splashRadius: 20,
              icon: Icon(
                CustomIcons.close,
                size: 20,
              ),
            ),
          ),
        ),
        showDevider ? Divider() : Container()
      ],
    );
  }
}
