import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/enums/coordinate_type.dart';
import 'package:places/ui/screen/add_sight_screen/app_text_form_field.dart';

class CoordinateTextField extends AppTextFormField {
  const CoordinateTextField({
    required this.type,
    required textController,
    required focusNode,
    required onEditingComplete,
    VoidCallback? onChange,
    this.isNecessaryField = true,
  }) : super(
          name: type == CoordinateType.longitude ? AppStrings.longitude : AppStrings.latitude,
          textController: textController,
          focusNode: focusNode,
          onChange: onChange,
          onEditingComplete: onEditingComplete,
          textInputType: TextInputType.number,
        );

  final bool isNecessaryField;
  final CoordinateType type;

  @override
  FormFieldValidator<String>? get validator => coordinateValidator;

  @override
  List<TextInputFormatter>? get inputFormatters => [
        ChangeCommaToDotFormatter(),
      ];

  String get coordinateName =>
      type == CoordinateType.longitude ? AppStrings.longitude : AppStrings.latitude;

  String? coordinateValidator(String? val) {
    if (isNecessaryField && (val == null || val == '')) {
      return '${coordinateName.toLowerCase()} ${AppStrings.needed.toLowerCase()}';
    }

    if (val != null) {
      double? distance = double.tryParse(val) ?? null;
      if (distance != null) {
        double max = type == CoordinateType.longitude ? 90 : 180, min = max * -1;
        if (distance < min)
          return '${AppStrings.min.toLowerCase()} ${coordinateName.toLowerCase()} $min';
        if (distance > max)
          return '${AppStrings.max.toLowerCase()} ${coordinateName.toLowerCase()} $max';

        return null;
      } else {
        return AppStrings.wrongFormat.toLowerCase();
      }
    } else
      return null;
  }
}

class ChangeCommaToDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.replaceAll(RegExp(','), '.'),
      selection: newValue.selection,
    );
  }
}
