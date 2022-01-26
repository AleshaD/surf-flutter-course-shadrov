import 'package:flutter/material.dart';

const TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
);

TextStyle largeTitleStyle = _text.copyWith(fontSize: 32, fontWeight: FontWeight.bold);
TextStyle titleStyle = _text.copyWith(fontSize: 24, fontWeight: FontWeight.bold);
TextStyle subtitleStyle = _text.copyWith(fontSize: 18);
TextStyle textStyle = _text.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
TextStyle smallBoldTxtStyle = _text.copyWith(fontSize: 14, fontWeight: FontWeight.bold);
TextStyle smallTxtStyle = _text.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2);
TextStyle superSmallTxtStyle = _text.copyWith(fontSize: 12);
TextStyle superSmallw400TxtStyle = _text.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
TextStyle buttonTxtStyle = _text.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
