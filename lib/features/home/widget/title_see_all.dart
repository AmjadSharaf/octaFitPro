import 'package:flutter/material.dart';
import 'package:octafitpro/shared/custom_text.dart';

class TitleSeeAll extends StatelessWidget {
  const TitleSeeAll({
    super.key,
    this.onTap,
    required this.text,
    required this.seeAll,
  });

  final String text;
  final String seeAll;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          color: Colors.white,
          size: 20,
          fontWeight: FontWeight.bold,
        ),
        InkWell(
          onTap: onTap,

          child: CustomText(
            text: seeAll,
            color: Colors.orange,
            size: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
