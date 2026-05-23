import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/chat_bot/view/chat_bot.dart';
import 'package:octafitpro/features/product/view/widget/area_contaenar_prudect.dart';
import 'package:octafitpro/features/product/view/widget/area_det_proudact.dart';
import 'package:octafitpro/shared/custom_button.dart';
import 'package:octafitpro/shared/custom_button_add.dart';

import 'package:octafitpro/shared/custom_text.dart';

class ProductDetlsView extends StatefulWidget {
  const ProductDetlsView({super.key});

  @override
  State<ProductDetlsView> createState() => _ProductDetlsViewState();
}

class _ProductDetlsViewState extends State<ProductDetlsView> {
  double value = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.primaryColor,
      appBar: AppBar(
        toolbarHeight: 80,

        backgroundColor: AppColorsDark.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 39, 59, 119),
            child: const Icon(Icons.arrow_back, size: 22, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatBotScreen()),
              );
            },
            icon: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 39, 59, 119),
              child: Icon(Icons.favorite_border, color: Colors.white),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 39, 59, 119),
              child: Icon(Icons.share_outlined, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,

                width: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[700],
                ),
                child: Image.asset("assets/test/test.jpg"),
              ),
              Gap(20),
              CustomText(
                text: "Premium Whey Protein",
                color: Colors.white,
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              Gap(15),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Gap(5),
                  CustomText(text: "4.5", color: Colors.white),
                ],
              ),
              Gap(15),
              CustomText(
                text: "\$ 49.99",
                color: Colors.orange,
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(15),
              CustomText(
                text:
                    "High-quality whey protein isolate designed for maximum muscle growth and recovery. Each serving provides 25g of pure protein with minimal carbs and fats",
                color: Colors.white,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              Gap(15),
              CustomText(
                text: "Key Features",
                color: Colors.white,
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(15),
              Container(
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
                  children: [
                    AreaDetProudact(text: "25g protein per serving"),
                    Gap(7),
                    AreaDetProudact(text: "Fast absorption formula"),
                    Gap(7),
                    AreaDetProudact(text: "Low carb & low fat"),
                    Gap(7),
                    AreaDetProudact(text: "Gluten-free"),
                    Gap(7),
                    AreaDetProudact(text: "30 servings per container"),
                  ],
                ),
              ),
              Gap(12),
              CustomText(
                text: "Select Flavor",
                color: Colors.white,
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(12),

              Gap(12),
              CustomText(
                text: "Select Size",
                color: Colors.white,
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Customer Reviews",
                    color: Colors.white,
                    size: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "See All ",
                    color: Colors.orange,
                    size: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Gap(10),
              AreaContaenarPrudect(
                count: 5,
                subtitle:
                    "Best protein I've ever used! Great taste and mixes well.",
                title: "Alex Johnson",
              ),
              Gap(10),

              CustomButtonAdd(
                widget: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                text: "Add to Cart",
                color: Colors.orange,
                onTap: () {},
                radius: 10,
                gap: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
