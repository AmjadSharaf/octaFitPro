import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';

class FitnessCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Function()? onTap;
  const FitnessCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 31, 49, 105),
                Color.fromARGB(255, 64, 85, 149),
              ],
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              ),
              Gap(20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                    Gap(10),
                    CustomText(
                      text: description,
                      maxline: 5,
                      size: 14,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
