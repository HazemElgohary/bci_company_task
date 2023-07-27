import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primary = const Color(0xFFFAFAFA);
  static Color second = const Color(0xFFF0F0F0);
  static Color buttonColor = const Color(0xFFEAEAEA);
  static Color loadingColor = const Color(0xFFAC2F2F);
  static Color cardColor = const Color(0xFFF7F7F9);
  static Color borderColor = const Color(0xFFD0D0D0);

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme(
      Theme.of(context).textTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.primary,
    // toggleableActiveColor: AppColors.primary,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      // color: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: context.textTheme.titleLarge!.copyWith(
          color: AppColors.blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.second, size: 30),
    ),
    dividerColor: Colors.transparent,
    radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black)),
    indicatorColor: AppColors.whiteColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
  );
}
