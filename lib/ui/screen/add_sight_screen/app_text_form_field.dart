import 'package:flutter/material.dart';
import 'package:places/styles/custom_icons.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.name,
    required this.textController,
    required this.focusNode,
    required this.onEditingComplete,
    TextInputType? textInputType,
  }) : this.textInputType = textInputType ?? TextInputType.text;

  final FocusNode focusNode;
  final String name;
  final VoidCallback onEditingComplete;
  final TextEditingController textController;
  final TextInputType textInputType;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool get showClearSuffix => widget.focusNode.hasFocus && widget.textController.text != '';

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
          maxLines: null,
          textInputAction: TextInputAction.done,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(maxHeight: 34, maxWidth: 34),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: widget.focusNode.hasFocus && widget.textController.text != ''
                  ? IconButton(
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
                    )
                  : Container(),
            ),
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
