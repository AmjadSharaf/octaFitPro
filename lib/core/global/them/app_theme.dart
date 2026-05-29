import 'package:flutter/material.dart';
import 'package:octafitpro/core/global/them/app_color.dart';


class AppTheme {

  // LIGHT THEME
  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,

    primaryColor: AppColors.primaryLight,

    scaffoldBackgroundColor:
        AppColors.scaffoldLight,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.black,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textLight,
        fontSize: 16,
      ),
    ),

    elevatedButtonTheme:
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            AppColors.primaryLight,

        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12),
        ),
      ),
    ),
  );

  // DARK THEME
  static ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,

    primaryColor: AppColors.primaryDark,

    scaffoldBackgroundColor:
        AppColors.scaffoldDark,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1E1E1E),
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textDark,
        fontSize: 16,
      ),
    ),

    elevatedButtonTheme:
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            AppColors.primaryDark,

        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12),
        ),
      ),
    ),
  );
}