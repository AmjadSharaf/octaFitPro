import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/home/widget/fitness_card.dart';

import 'package:octafitpro/features/home/widget/fitness_card_image.dart';

import 'package:octafitpro/features/home/widget/title_see_all.dart';
import 'package:octafitpro/features/home/widget/user_heder_home.dart';
import 'package:octafitpro/features/store/view/store_view.dart';

import 'package:octafitpro/features/store/widget/search_field.dart';
import 'package:octafitpro/features/training/view/training_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingView(),
                            ),
                          );
                        },
                      ),

                      Gap(15),
                      FitnessCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingView(),
                            ),
                          );
                        },
                        title: 'Muay thai Training',
                        description:
                            'The art of eight limbs master strikes using fists, elbows, knees, and shins for power and agility',
                        imageUrl: 'assets/test/muay.jpg',
                      ),

                      Gap(15),
                      FitnessCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingView(),
                            ),
                          );
                        },
                        title: 'Kick boxing',
                        description:
                            'High energy combat sport combining punches and kicks for cardio and full body ',
                        imageUrl: 'assets/test/Kick.jpg',
                      ),

                      TitleSeeAll(
                        text: "Fitness ",
                        seeAll: "See All",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingView(),
                            ),
                          );
                        },
                      ),

                      Gap(15),
                      FitnessCardImage(
                        title: 'BodyBuilding',
                        imagUrl: 'assets/test/body.jpg',
                        title2: 'Calisthenics',
                        imagUrl2: 'assets/test/cal.jpg',
                      ),
                      Gap(15),
                      TitleSeeAll(
                        text: "Products",
                        seeAll: "View Store ",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoreView(),
                            ),
                          );
                        },
                      ),
                      Gap(15),
                      FitnessCardImage(
                        title: 'equipment',
                        imagUrl: 'assets/test/cc.jpg',
                        title2: 'clothes',
                        imagUrl2: 'assets/test/kk.jpg',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
