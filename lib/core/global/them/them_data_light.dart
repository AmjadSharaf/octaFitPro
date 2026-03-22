import 'package:flutter/material.dart';

import '../color/app_colors_light.dart';


ThemeData getthemeDataLight() => ThemeData(
  
  appBarTheme: AppBarTheme(backgroundColor: AppColorsLight.appbarcolor),
  textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
);



