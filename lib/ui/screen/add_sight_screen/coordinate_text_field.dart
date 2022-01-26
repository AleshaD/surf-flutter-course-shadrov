import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          name: type == CoordinateType.longitude ? 'Широта' : 'Долгота',
          textController: textController,
          focusNode: focusNode,
          onChange: onChange,
          onEditingComplete: onEditingComplete,
          textInputType: TextInputType.number,
        );

  final bool isNecessaryField;
  final CoordinateType type;

  @override
  FormFieldValidator<String>? get validator => longitudeValidator;

  @override
  List<TextInputFormatter>? get inputFormatters => [
        ChangeCommaToDotFormatter(),
      ];

  String get coordinateName => type == CoordinateType.longitude ? 'Широта' : 'Долгота';

  String? longitudeValidator(String? val) {
    if (isNecessaryField && (val == null || val == '')) {
      return '${coordinateName.toLowerCase()} обязательна';
    }

    if (val != null) {
      double? d = double.tryParse(val) ?? null;
      if (d != null) {
        double max = type == CoordinateType.longitude ? 90 : 180, min = max * -1;
        if (d < min) return 'мин ${coordinateName.toLowerCase()} $min';
        if (d > max) return 'макс ${coordinateName.toLowerCase()} $max';

        return null;
      } else {
        return 'не верный формат';
      }
    }
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
