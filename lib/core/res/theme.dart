import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/res/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();
  static final currentTheme = ThemeData(
    colorSchemeSeed: Colours.primaryColor,
    scaffoldBackgroundColor: Colours.backgroundColor,
    brightness: Brightness.dark,
    textTheme: AppFonts.textTheme,
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (_) => const Icon(
        Icons.chevron_left,
        size: Sizes.p36,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colours.backgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: const IconThemeData(
        color: Colours.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 8),
      ),
    ),
  );
}
