import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static const double margin = 16;
  static const padding = EdgeInsets.all(margin);
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: margin);
  static const verticalPadding = EdgeInsets.symmetric(vertical: margin);
  static const headLine1 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black);

  static const headLine2 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black);
  static const headLine3 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.black);

  static const body1 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.black);

  static const body2 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black);

  static const subtitle1 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black54);

  static const subtitle2 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.blackLight);

  static final buttonStyle = GoogleFonts.notoSans(
      color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600);

  static const double radius = 16;
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  static const shadow = BoxShadow(
    color: Color(0xffe3e3e3),
    spreadRadius: 0.1,
    blurRadius: 5,
  );
}

class AppColors {
  static const white = Colors.white;
  static const black = Colors.black87;
  static const blackLight = Color(0xffbfbfbf);
}
