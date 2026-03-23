import 'package:flutter/material.dart';

class AppColorsDark {
  static final appbarcolor = Colors.blue;

  static Color? get textColor => null;
  static final primaryColor = Color(0xff1c2e63);

  LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      primaryColor, // درجة أفتح
    ],
  );
}
