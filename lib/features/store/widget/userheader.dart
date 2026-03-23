import 'package:flutter/material.dart';


import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: "Store",
          size: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ],
    );
  }
}
