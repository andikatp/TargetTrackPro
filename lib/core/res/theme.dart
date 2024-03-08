import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/res/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: Colours.redColor,
    scaffoldBackgroundColor: Colours.whiteColor,
    brightness: Brightness.light,
    textTheme: AppFonts.textLightTheme,
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (_) => const Icon(
        Icons.chevron_left,
        size: Sizes.p36,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colours.redColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: const IconThemeData(
        color: Colours.redColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colours.redColor,
      foregroundColor: Colours.whiteColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 8),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        minimumSize: const Size.fromHeight(Sizes.p44),
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 18.sp),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        backgroundColor: Colours.redColor,
        foregroundColor: Colours.whiteColor,
        minimumSize: Size.fromHeight(Sizes.p56.h),
      ),
    ),
  );
}
