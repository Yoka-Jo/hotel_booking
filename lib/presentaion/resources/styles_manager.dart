import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';
import 'package:flutter/material.dart';

enum FontFamilies { montserrat, lato }

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, FontFamilies family) {
  switch (family) {
    case FontFamilies.montserrat:
      return GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
    case FontFamilies.lato:
      return GoogleFonts.lato(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
  }
}

TextStyle getRegularStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, family);
}

TextStyle getMediumStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, family);
}

TextStyle getLightStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, family);
}

TextStyle getBoldStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, family);
}

TextStyle getSemiBoldStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, family);
}
