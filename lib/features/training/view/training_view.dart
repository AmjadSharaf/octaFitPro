import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/store/widget/FoodCategory.dart';
import 'package:octafitpro/features/store/widget/card_item.dart';
import 'package:octafitpro/features/training/widget/user_header.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({super.key});

  @override
  State<TrainingView> createState() => _HomeViewState();
}

class _HomeViewState extends State<TrainingView> {
  List category = ["All", "MMA", "BodyBuilding ", "Home Workout"];
  int selectedIndex = 0;

  final List allTraining = [
    {"title": "MMA Striking Masterclass", "category": "MMA"},
    {"title": "BodyBuilding Workout", "category": "BodyBuilding"},
    {"title": "Home Workout Beginner", "category": "Home Workout"},
  ];

  @override
  Widget build(BuildContext context) {
    List filteredTraining;

    if (selectedIndex == 0) {
      filteredTraining = allTraining;
    } else {
      filteredTraining = allTraining.where((item) {
        return item["category"] == category[selectedIndex];
      }).toList();
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0f1b3d),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white, // لون سهم الرجوع
          ),
        ),
        backgroundColor: AppColorsDark.primaryColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
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
                backgroundColor: const Color(0xff0f1b3d),
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                iconTheme: const IconThemeData(color: Colors.white),
                flexibleSpace: ClipRRect(
                  // borderRadius: BorderRadius.circular(2),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: const BoxDecoration(
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
                        child: Column(children: [UserHeader(), Gap(2)]),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),

                  child: Column(
                    children: [
                      // SearchField(),
                      Gap(20),
                      FoodCategory(
                        selectedIndex: selectedIndex,
                        category: category,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: filteredTraining
                        .length, // عدد التمارين القادمة من الباك اند

                    (context, index) {
                      // بيانات وهمية حاليا - لاحقاً من API
                      final training = filteredTraining[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),

                        child: Container(
                          height: 300,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),

                            gradient: const LinearGradient(
                              colors: [Color(0xff24386f), Color(0xff314c99)],
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // الصورة
                              Expanded(
                                flex: 6,

                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),

                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Image.network(
                                          training["image"] ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                        ),

                                        color: Colors.black.withOpacity(0.15),
                                      ),
                                    ),

                                    // مستوى التمرين
                                    Positioned(
                                      top: 15,
                                      left: 15,

                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),

                                        child: Text(
                                          training["level"] ?? "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // أيقونة التشغيل
                                    const Center(
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.white24,

                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          size: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    // أيقونة المفضلة
                                    const Positioned(
                                      top: 15,
                                      right: 15,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // المعلومات
                              Expanded(
                                flex: 3,

                                child: Padding(
                                  padding: const EdgeInsets.all(20),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        training["title"] ?? "",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const Spacer(),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.access_time_outlined,
                                            color: Colors.white70,
                                            size: 16,
                                          ),

                                          const Gap(2),

                                          Text(
                                            training["duration"] ?? "",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16,
                                            ),
                                          ),

                                          const Gap(20),

                                          const Icon(
                                            Icons.local_fire_department,
                                            color: Colors.orange,
                                            size: 20,
                                          ),

                                          const Gap(5),

                                          Text(
                                            training["calories"] ?? "",
                                            style: const TextStyle(
                                              color: Colors.orange,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
