import 'package:business/core/res/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  AppFonts._();

  static TextTheme textDarkTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 76.sp,
      color: Colours.whiteColor,
    ),
    displayMedium: TextStyle(
      fontSize: 60.sp,
      fontWeight: FontWeight.w400,
      color: Colours.whiteColor,
    ),
    displaySmall: TextStyle(
      fontSize: 48.sp,
      color: Colours.whiteColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 42.sp,
      color: Colours.whiteColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 37.sp,
      color: Colours.whiteColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 32.sp,
      color: Colours.whiteColor,
    ),
    titleLarge: TextStyle(
      fontSize: 30.sp,
      color: Colours.whiteColor,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 21.sp,
      color: Colours.whiteColor,
      wordSpacing: 0.15.w,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 18.sp,
      color: Colours.whiteColor,
      wordSpacing: 0.1.w,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 18.sp,
      letterSpacing: 1.25.w,
      wordSpacing: 0.1.w,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      color: Colours.whiteColor,
      wordSpacing: 0.5.w,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      wordSpacing: 0.5.w,
      color: Colours.whiteColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 21.sp,
      letterSpacing: 0.15.w,
      color: Colours.whiteColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      letterSpacing: 0.25.w,
      color: Colours.whiteColor,
    ),
    bodySmall: TextStyle(
      fontSize: 16.sp,
      letterSpacing: 0.4.w,
      color: Colours.whiteColor,
    ),
  );

  static TextTheme textLightTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 76.sp,
    ),
    displayMedium: TextStyle(
      fontSize: 60.sp,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 48.sp,
    ),
    headlineLarge: TextStyle(
      fontSize: 42.sp,
    ),
    headlineMedium: TextStyle(
      fontSize: 37.sp,
    ),
    headlineSmall: TextStyle(
      fontSize: 32.sp,
    ),
    titleLarge: TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 21.sp,
      wordSpacing: 0.15.w,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 18.sp,
      wordSpacing: 0.1.w,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 18.sp,
      letterSpacing: 1.25.w,
      wordSpacing: 0.1.w,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      wordSpacing: 0.5.w,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      wordSpacing: 0.5.w,
    ),
    bodyLarge: TextStyle(
      fontSize: 21.sp,
      letterSpacing: 0.15.w,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      letterSpacing: 0.25.w,
    ),
    bodySmall: TextStyle(
      fontSize: 16.sp,
      letterSpacing: 0.4.w,
    ),
  );
}
