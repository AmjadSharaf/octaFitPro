import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';

class AreaDetProudact extends StatelessWidget {
  const AreaDetProudact({super.key, this.text});
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        Gap(15),
        CustomText(text: text, color: Colors.white),
      ],
    );
  }
}
