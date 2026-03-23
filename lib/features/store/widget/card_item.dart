import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
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
  final String image, text, desc, rate;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 500),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Text(""),
                      // child: Image.asset(
                      //   'assets/test/test.png',
                      //   color: Colors.black26,
                      // ),
                    ),
                    Center(child: Image.asset(image, width: 130, height: 135)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: text,
                        fontWeight: FontWeight.bold,
                        size: 13,
                        color: Colors.white,
                      ),
                      CustomText(
                        text: desc,
                        size: 10,
                        color: Color(0xffff7a3c),
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: Color(0xffff7a3c),
                          ),
                          Gap(6),
                          CustomText(
                            text: rate,
                            size: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColorsDark.primaryColor,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (c) => CartView()),
                            ),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffff7a3c),
                              ),
                              child: Icon(
                                CupertinoIcons.add,
                                color: Colors.white,
                                size: 20,
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
          ),
        ),
      ),
    );
  }
}
