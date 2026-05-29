import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/auth/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // بعد 5 ثواني ترجع تلقائياً
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.primaryColor,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gap(180),
            SizedBox(height: 120),
            SvgPicture.asset("assets/logo/logo.svg"),
            SizedBox(height: 120),

            // Spacer(),
            SvgPicture.asset("assets/splash/splash.svg"),
          ],
        ),
      ),
    );
  }
}
