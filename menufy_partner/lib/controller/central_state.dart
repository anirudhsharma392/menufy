import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menufy_partner/controller/base_controller.dart';
import 'package:menufy_partner/theme/theme.dart';

class CentralState extends BaseController {
  //dynamic app theme for the app

  final appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.white,
    primaryColor: AppColors.black,
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(primary: AppColors.black, secondary: AppColors.blackLight),
    textTheme: GoogleFonts.nunitoTextTheme(),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.blackLight,
      selectionHandleColor: AppColors.blackLight,
    ),
  );
}
