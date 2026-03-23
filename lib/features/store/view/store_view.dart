import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/store/widget/FoodCategory.dart';
import 'package:octafitpro/features/store/widget/card_item.dart';
import 'package:octafitpro/features/store/widget/search_field.dart';
import 'package:octafitpro/features/store/widget/userheader.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _HomeViewState();
}

class _HomeViewState extends State<StoreView> {
  List category = ["All", "Supplemnets", "Equipment", "Clothes", "Accessories"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: AppColorsDark.primaryColor,
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
                        child: Column(children: [UserHeader()]),
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
                      SearchField(),
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
                        image: "assets/test/test.jpg",
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
      ),
    );
  }
}
