import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({
    this.readOnly = false,
    this.showFilterBtn = false,
    this.onFieldTap,
  });

  final bool readOnly;
  final bool showFilterBtn;
  final VoidCallback? onFieldTap;

  @override
  State<SearchBar> createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(52);
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();

  final OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColor,
        cursorWidth: 1,
        style: Theme.of(context).textTheme.bodyText1,
        textAlignVertical: TextAlignVertical.bottom,
        readOnly: widget.readOnly,
        onTap: widget.onFieldTap,
        decoration: InputDecoration(
          hintText: AppStrings.searh,
          hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 16),
          border: defaultBorder,
          enabledBorder: defaultBorder,
          focusedBorder: defaultBorder,
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryVariant,
          prefixIconConstraints: BoxConstraints(maxHeight: 40),
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 16, right: 14),
            child: Icon(
              CustomIcons.search,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 34),
          suffixIcon: widget.showFilterBtn
              ? Material(
                  type: MaterialType.transparency,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    splashRadius: 16,
                    iconSize: 20,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FiltersScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      CustomIcons.filter,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
