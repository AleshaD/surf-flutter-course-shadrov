import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/ui/router/app_router.dart';
import 'package:places/ui/styles/custom_icons.dart';
import 'package:places/ui/screen/filters_screen/filter_screen.dart';
import 'package:places/ui/widgets/buttons/suffix_button.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({
    this.readOnly = false,
    this.showFilterBtn = false,
    this.autoFocus = false,
    this.controller,
    this.onFieldTap,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusDismiss,
  });

  final bool readOnly;
  final bool showFilterBtn;
  final bool autoFocus;
  final TextEditingController? controller;
  final VoidCallback? onFieldTap;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onFocusDismiss;
  final Function(String)? onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(52);
}

class _SearchBarState extends State<SearchBar> {
  FocusNode focusNode = FocusNode();

  final OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus && widget.onFocusDismiss != null) {
        widget.onFocusDismiss!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        controller: widget.controller,
        focusNode: focusNode,
        cursorColor: Theme.of(context).primaryColor,
        cursorWidth: 1,
        style: Theme.of(context).textTheme.bodyText1,
        textAlignVertical: TextAlignVertical.bottom,
        textInputAction: TextInputAction.search,
        readOnly: widget.readOnly,
        autofocus: widget.autoFocus,
        onTap: widget.onFieldTap,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          hintText: AppStrings.searh,
          hintStyle:
              Theme.of(context).textTheme.caption!.copyWith(fontSize: 16),
          border: defaultBorder,
          enabledBorder: defaultBorder,
          focusedBorder: defaultBorder,
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryContainer,
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
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8),
            child: widget.showFilterBtn
                ? SuffixButton(
                    onPressed: () => context.pushRoute(FilterRoute()),
                    iconData: CustomIcons.filter,
                    iconColor: Theme.of(context).colorScheme.secondary,
                  )
                : SuffixButton(
                    onPressed: () {
                      if (widget.controller != null) widget.controller!.clear();
                      if (widget.onChanged != null) widget.onChanged!('');
                    },
                    iconData: CustomIcons.clear,
                  ),
          ),
        ),
      ),
    );
  }
}
