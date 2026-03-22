import 'package:flutter/material.dart';
import 'package:octafitpro/features/auth/view/login_view.dart';
import 'package:octafitpro/features/auth/view/sinup_view.dart';

import 'package:octafitpro/splash_view.dart';

import 'core/global/them/theme_data_dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getthemDataDark(),
      home: SinupView(),
    );
  }
}
