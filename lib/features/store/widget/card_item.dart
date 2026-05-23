import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/features/cart/view/cart_view.dart';
import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.rate,
  });

  final String image, text, desc;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0f1b3d),
                  Color(0xff16244f),
                  Color(0xff1c2e63),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Glass effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.white.withOpacity(0.03)),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image + overlay
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(image, fit: BoxFit.contain),

                      // Gradient overlay على الصورة
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Gap(8),

                // Title
                CustomText(
                  text: text,
                  fontWeight: FontWeight.bold,
                  size: 16,
                  color: Colors.white,
                ),

                Gap(6),

                // Rating
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      size: 14,
                      color: Color(0xffff7a3c),
                    ),
                    Gap(5),
                    CustomText(
                      text: "$rate",
                      size: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),

                Gap(6),

                // Price + Add button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "\$ $desc",
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffff7a3c),
                    ),

                    GestureDetector(
                      // borderRadius: BorderRadius.circular(12),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => CartView()),
                      ),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [Color(0xffff7a3c), Color(0xffffb36b)],
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color(0xffff7a3c).withOpacity(0.4),
                          //     blurRadius: 8,
                          //     offset: Offset(0, 4),
                          //   ),
                          // ],
                        ),
                        child: Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
