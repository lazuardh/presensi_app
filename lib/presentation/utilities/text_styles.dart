import 'package:flutter/material.dart';

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semibold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

TextStyle heading1(colorText, fontWeight) {
  return TextStyle(color: colorText, fontSize: 61, fontWeight: fontWeight);
}

TextStyle text1(colorText, fontWeight) {
  return TextStyle(color: colorText, fontSize: 20, fontWeight: fontWeight);
}

TextStyle text2(colorText, fontWeight) {
  return TextStyle(color: colorText, fontSize: 18, fontWeight: fontWeight);
}

TextStyle text3(colorText, fontWeight) {
  return TextStyle(color: colorText, fontSize: 16, fontWeight: fontWeight);
}

TextStyle text4(colorText, fontWeight) {
  return TextStyle(color: colorText, fontSize: 14, fontWeight: fontWeight);
}
