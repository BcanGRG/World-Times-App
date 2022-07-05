import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_times_app/product/utils/color_constants.dart';

class ThemeDatas {
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: ColorConstants.solitudeBlue),
    primaryColor: ColorConstants.prussianBlue,
    backgroundColor: ColorConstants.zirconWhite,
    focusColor: ColorConstants.dullLavenderBlue,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: ColorConstants.resolutionBlue),
    primaryColor: Colors.white,
    backgroundColor: ColorConstants.prussianBlue,
    focusColor: ColorConstants.resolutionBlue,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
}
