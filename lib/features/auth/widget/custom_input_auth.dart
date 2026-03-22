import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';
import 'package:octafitpro/shared/custom_txtfield.dart';

class CustomInputAuth extends StatelessWidget {
  const CustomInputAuth({
    super.key,
    required this.lable,
    required this.text,
    required this.ispassword,
    required this.controller,
  });
  final String lable, text;
  final bool ispassword;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: lable, color: Colors.white),
        Gap(7),
        CustomTxtfield(
          iconperfex: Icon(Icons.person_2_outlined),
          hint: text,
          isPassword: ispassword,
          controller: controller,
        ),
      ],
    );
  }
}
