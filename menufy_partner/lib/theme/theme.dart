import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static const double margin = 16;
  static const padding = EdgeInsets.all(margin);
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: margin);
  static const verticalPadding = EdgeInsets.symmetric(vertical: margin);

  static TextStyle jumboText = GoogleFonts.openSans(
      fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.black);

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
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.7);

  static const double radius = 10;
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  static const shadow = BoxShadow(
    color: Color(0xffe3e3e3),
    spreadRadius: 0.1,
    blurRadius: 5,
  );
  static get textTheme => TextTheme(
    headline1: headLine1,
    headline2: headLine2,
    headline3: headLine3,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText1: body1,
    bodyText2: body2,
    button: buttonStyle,

  );
}

class AppColors {
  static const white = Colors.white;
  static const black = Colors.black87;
  static const blackLight = Color(0xffbfbfbf);
  static const blackLightest = Colors.black12;
  static const backgroundColor = Color(0xffF4F4F4);
  static const error = CupertinoColors.systemRed;
  static const success = CupertinoColors.activeGreen;
  static const disabled = CupertinoColors.inactiveGray;
  static const focus = CupertinoColors.activeBlue;
}
