import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
