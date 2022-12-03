import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/widgets/buttons/suffix_button.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.name,
    required this.textController,
    required this.focusNode,
    this.onEditingComplete,
    this.onChange,
    this.validator,
    this.inputFormatters,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.showClearTxtBtn = true,
    this.hint = '',
    this.maxLines,
  });

  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode focusNode;
  final String name;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onChange;
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
      setState(() {
        //перестроить виджет на случай нужно ли показывать
        //кнопку удаления
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.dispose();
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
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 16,
                ),
            suffixIconConstraints: BoxConstraints(maxHeight: 34, maxWidth: 60),
            suffixIcon: showClearBtnSuffix
                ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SuffixButton(
                      onPressed: () => setState(() {
                            widget.textController.clear();
                            if (widget.onChange != null) widget.onChange!();
                          }),
                      iconData: CustomIcons.clear),
                )
                : Container(),
          ),
          onEditingComplete: () => setState(() {
            widget.focusNode.unfocus();
            if (widget.onEditingComplete != null) widget.onEditingComplete!();
          }),
          onChanged: (value) {
            setState(() {
              //перестроить виджет на случай нужно ли показывать
              //кнопку удаления
            });
            if (widget.onChange != null) widget.onChange!();
          },
        ),
      ],
    );
  }
}
