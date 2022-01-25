import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.name,
    required this.textController,
    required this.focusNode,
    required this.onEditingComplete,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.showClearTxtBtn = true,
    this.hint = '',
    this.maxLines,
  });

  final FocusNode focusNode;
  final String name;
  final VoidCallback onEditingComplete;
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool showClearTxtBtn;
  final String hint;
  final int? maxLines;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool get showClearBtnSuffix =>
      widget.showClearTxtBtn && widget.focusNode.hasFocus && widget.textController.text != '';

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name.toUpperCase(),
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: widget.textController,
          focusNode: widget.focusNode,
          keyboardType: widget.textInputType,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: Theme.of(context).primaryColor,
          cursorWidth: 1,
          maxLines: widget.maxLines,
          textInputAction: widget.textInputAction,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 16,
                ),
            suffixIconConstraints: BoxConstraints(maxHeight: 34, maxWidth: 34),
            suffixIcon: showClearBtnSuffix
                ? Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      splashRadius: 16,
                      iconSize: 20,
                      onPressed: () => setState(() {
                        widget.textController.clear();
                      }),
                      icon: Icon(
                        CustomIcons.clear,
                        size: 20,
                      ),
                    ),
                  )
                : Container(),
          ),
          onEditingComplete: () => setState(() {
            widget.focusNode.unfocus();
            widget.onEditingComplete();
          }),
          onChanged: (value) => setState(() {}),
        ),
      ],
    );
  }
}
