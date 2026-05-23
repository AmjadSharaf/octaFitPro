import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';

class MixedMartialArtCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Function()? onTap;
  const MixedMartialArtCard({
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
      child: Container(
        height: 100,
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
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
            Gap(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  size: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                Gap(10),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
