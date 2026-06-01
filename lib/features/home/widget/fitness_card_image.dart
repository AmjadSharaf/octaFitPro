import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';

class FitnessCardImage extends StatelessWidget {
  const FitnessCardImage({
    super.key,
    required this.title,
    required this.imagUrl,
    required this.title2,
    required this.imagUrl2,
  });

  final String title;
  final String title2;
  final String imagUrl;
  final String imagUrl2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الكرت الأول
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 31, 49, 105),
                  Color.fromARGB(255, 64, 85, 149),
                ],
              ),
            ),
            child: Column(
              children: [
                const Gap(10),
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Image.asset(imagUrl, fit: BoxFit.cover),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: title,
                    size: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        const Gap(10),

        // الكرت الثاني
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 31, 49, 105),
                  Color.fromARGB(255, 64, 85, 149),
                ],
              ),
            ),
            child: Column(
              children: [
                const Gap(10),
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Image.asset(imagUrl2, fit: BoxFit.cover),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: title2,
                    size: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
