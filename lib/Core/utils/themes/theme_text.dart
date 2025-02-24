import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headlineMedium!.copyWith(
        fontSize: 20.sp,
        color: Colors.white,
      );
  static getTextTheme() => TextTheme(
        headlineMedium: _whiteHeadline6,
      );
}