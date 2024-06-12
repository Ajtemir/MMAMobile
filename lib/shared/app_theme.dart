import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      // color: Colors.white,
      // shadowColor: Colors.white,
      // foregroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      // backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 2,
      titleTextStyle: AppTextStyles.black18Semibold.copyWith(fontSize: 16.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        // maximumSize: Size(345, 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 140,
          vertical: 15,
        ),
        elevation: 0,
        // splashFactory: InteractiveInkFeature()
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // constraints: BoxConstraints(
      //   maxHeight: 50,
      //   minHeight: 49,
      // ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.black20Bold,
      displayMedium:
          AppTextStyles.black20Bold.copyWith(fontWeight: FontWeight.w600),
      titleLarge: AppTextStyles.black16Medium,
    ),
  );
}
