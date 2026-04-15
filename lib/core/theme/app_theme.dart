import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/style/font_utils.dart';
import 'package:qerp_app/core/theme/app_theme_data.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    canvasColor: AppColors.white,
    cardColor: AppColors.white,
    disabledColor: AppColors.white.withValues(alpha: 0.2),
    hintColor: AppColors.hintColor,
    dividerTheme: DividerThemeData(
      color: AppColors.dividerColor,
      space: 20.h,
      thickness: 1.25.r,
    ),
    unselectedWidgetColor: AppColors.white.withValues(alpha: 0.2),
    dividerColor: AppColors.white,
    fontFamily: AppFont.fontFamily,
    pageTransitionsTheme: AppThemeData.pageTransitionsTheme,
    appBarTheme: AppThemeData.appBarTheme(
      texColor: AppColors.black,
      backgroundColor: AppColors.lightBackground,
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.white,
      secondary: AppColors.white,
      surface: AppColors.black,
      shadow: AppColors.dividerColor,
      outline: AppColors.dividerColor,
      onError: AppColors.red,
      onPrimary: AppColors.white,
    ),
    inputDecorationTheme: AppThemeData.inputDecorationTheme(
      fillColor: AppColors.white,
      borderColor: AppColors.white,
      hintColor: AppColors.hintColor,
      primaryColor: AppColors.white,
      textColor: AppColors.black,
    ),
    elevatedButtonTheme: AppThemeData.elevatedButtonThemeData(
      primaryColor: AppColors.purple,
    ),
    checkboxTheme: AppThemeData.checkboxThemeData(
      primaryColor: AppColors.white,
    ),
    iconTheme: IconThemeData(color: AppColors.hintColor, size: 25.r),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.purple,
      selectionHandleColor: AppColors.purple,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.purple,
      unselectedItemColor: AppColors.lightGray,
    ),
    tabBarTheme: AppThemeData.tabBarThemeData(
      primaryColor: AppColors.white,
      borderColor: AppColors.white,
    ),
    textTheme: AppThemeData.textTheme(textColor: AppColors.black),
    cardTheme: CardThemeData(
      elevation: 0.25,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),

  );

  static ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    canvasColor: AppColors.darkCardColor,
    cardColor: AppColors.darkCardColor,
    disabledColor: AppColors.black.withValues(alpha: 0.2),
    hintColor: AppColors.hintColor,
    dividerTheme: DividerThemeData(
      color: AppColors.dividerColor,
      space: 20.h,
      thickness: 1.25.r,
    ),
    unselectedWidgetColor: AppColors.black.withValues(alpha: 0.2),
    dividerColor: AppColors.dividerColor,
    fontFamily: AppFont.fontFamily,
    pageTransitionsTheme: AppThemeData.pageTransitionsTheme,
    appBarTheme: AppThemeData.appBarTheme(
      texColor: AppColors.white,
      backgroundColor: AppColors.black,
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.black,
      secondary: AppColors.darkCardColor,
      surface: AppColors.white,
      shadow: AppColors.black,
      outline: AppColors.black,
      onError: AppColors.red,
      onPrimary: AppColors.black,
    ),
    inputDecorationTheme: AppThemeData.inputDecorationTheme(
      fillColor: AppColors.black,
      borderColor: AppColors.black,
      hintColor: AppColors.hintColor,
      primaryColor: AppColors.black,
      textColor: AppColors.white,
    ),
    elevatedButtonTheme: AppThemeData.elevatedButtonThemeData(
      primaryColor: AppColors.purple,
    ),
    checkboxTheme: AppThemeData.checkboxThemeData(
      primaryColor: AppColors.black,
    ),
    iconTheme: IconThemeData(color: AppColors.hintColor, size: 25.r),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.purple,
      selectionHandleColor: AppColors.purple,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkCardColor,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkCardColor,
      selectedItemColor: AppColors.purple,
      unselectedItemColor: AppColors.lightGray,
    ),
    tabBarTheme: AppThemeData.tabBarThemeData(
      primaryColor: AppColors.black,
      borderColor: AppColors.black,
    ),
    textTheme: AppThemeData.textTheme(textColor: AppColors.white),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.darkCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),
    
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 2,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
    ),
  );
}
