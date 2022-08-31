import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_maker/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:menu_maker/theme/theme.dart';

class CentralState extends BaseController {
  //dynamic app theme for the app

  final appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: Color(0xffFFC72C),
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(primary: Color(0xffFFC72C), secondary: Color(0xffFFC72C)),
    textTheme: GoogleFonts.nunitoTextTheme(),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.blackLight,
      selectionHandleColor: AppColors.blackLight,
    ),
  );
}
