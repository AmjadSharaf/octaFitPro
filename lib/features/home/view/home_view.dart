import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/home/widget/fitness_card.dart';
import 'package:octafitpro/features/home/widget/fitness_card_image.dart';
import 'package:octafitpro/features/home/widget/mixed_martial_art_card.dart';
import 'package:octafitpro/features/home/widget/title_see_all.dart';
import 'package:octafitpro/features/home/widget/user_heder_home.dart';
import 'package:octafitpro/features/store/view/store_view.dart';

import 'package:octafitpro/features/store/widget/search_field.dart';
 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
            colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
          ),
        ),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              toolbarHeight: 150,
              scrolledUnderElevation: 0,
              backgroundColor: AppColorsDark.primaryColor,
              automaticallyImplyLeading: false,
              flexibleSpace: ClipRRect(
                // borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff0f1b3d),
                          Color(0xff16244f),
                          Color(0xff1c2e63),
                        ],
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                        right: 20,
                        left: 20,
                      ),
                      child: Column(children: [UserHederHome()]),
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),

                child: Column(
                  children: [
                    SearchField(),
                    Gap(20),
                    TitleSeeAll(
                      text: "Mixed Martial Art",
                      seeAll: "See All",
                      onTap: () {},
                    ),

                    Gap(15),
                    MixedMartialArtCard(
                      onTap: () {},
                      title: "Muay thai Training",
                      description: "Get stronger with Muay thai workouts",
                      imageUrl: "assets/test/test.jpg",
                    ),

                    Gap(15),
                    MixedMartialArtCard(
                      onTap: () {},
                      title: "Muay thai Training",
                      description: "Get stronger with Muay thai workouts",
                      imageUrl: "assets/test/test.jpg",
                    ),

                    TitleSeeAll(text: "Fitness ", seeAll: "See All"),

                    Gap(15),
                    FitnessCardImage(),
                    Gap(15),
                    TitleSeeAll(
                      text: "Products",
                      seeAll: "View Store ",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StoreView()),
                        );
                      },
                    ),
                    Gap(15),
                    FitnessCardImage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
