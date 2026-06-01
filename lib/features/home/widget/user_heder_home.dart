import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:octafitpro/shared/custom_text.dart';

class UserHederHome extends StatelessWidget {
  const UserHederHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "OctaFit ",

              size: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),

            CustomText(
              text: "welcom_back_Champion".tr(),
              color: Colors.white70,

              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
