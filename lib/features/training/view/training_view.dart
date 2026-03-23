import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:octafitpro/features/store/widget/FoodCategory.dart';
import 'package:octafitpro/features/store/widget/card_item.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({super.key});

  @override
  State<TrainingView> createState() => _HomeViewState();
}

class _HomeViewState extends State<TrainingView> {
  List category = ["Pizza", "Burger", "Sushi", "Dessert", "Drinks"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        body: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              toolbarHeight: 150,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withAlpha(450),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                        right: 20,
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          // UserHeader(),
                          Gap(2),
                        ],
                      ),
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
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.73,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(childCount: 12, (
                  context,
                  index,
                ) {
                  return GestureDetector(
                    // onTap: () => Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (c) => ProductDetView()),
                    // ),
                    child: CardItem(
                      image: "assets/test/test.png",
                      text: "text",
                      desc: "desc",
                      rate: "rate",
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
