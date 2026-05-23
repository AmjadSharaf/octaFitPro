import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';

class AreaContaenarPrudect extends StatelessWidget {
  const AreaContaenarPrudect({
    super.key,
    required this.count,
    required this.title,
    required this.subtitle,
  });
  final int count;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 27, 43, 90),
            Color.fromARGB(255, 64, 85, 149),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, size: 15, color: Colors.white),
          Gap(7),
          Row(
            children: List.generate(
              count,
              (index) => const Icon(Icons.star, size: 15, color: Colors.orange),
            ),
          ),
          Gap(7),
          CustomText(text: subtitle, size: 15, color: Colors.white),
        ],
      ),
    );
  }
}
