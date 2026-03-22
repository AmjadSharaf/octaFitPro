import 'package:flutter/material.dart';

import '../color/app_colors_dark.dart';


ThemeData getthemDataDark() => ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: AppColorsDark.appbarcolor),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColorsDark.textColor),
    bodySmall: TextStyle(color: AppColorsDark.textColor),
    bodyMedium: TextStyle(color: AppColorsDark.textColor),
    displayLarge: TextStyle(color: AppColorsDark.textColor),
    displayMedium: TextStyle(color: AppColorsDark.textColor),
    displaySmall: TextStyle(color: AppColorsDark.textColor),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: AppColorsDark.textColor),
    headlineSmall: TextStyle(color: AppColorsDark.textColor),
    labelLarge: TextStyle(color: AppColorsDark.textColor),
    labelMedium: TextStyle(color: AppColorsDark.textColor),
    labelSmall: TextStyle(color: AppColorsDark.textColor),
    titleLarge: TextStyle(color: AppColorsDark.textColor),
    titleMedium: TextStyle(color: AppColorsDark.textColor),
    titleSmall: TextStyle(color: AppColorsDark.textColor),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black)),
  ),
);
