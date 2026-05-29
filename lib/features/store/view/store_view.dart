// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:gap/gap.dart';
// import 'package:octafitpro/core/global/color/app_colors_dark.dart';
// import 'package:octafitpro/features/store/data/category_model.dart';
// import 'package:octafitpro/features/store/data/product_mode.dart';
// import 'package:octafitpro/features/store/servier/category_service.dart';
// import 'package:octafitpro/features/product/view/product_detls_view.dart';
// import 'package:octafitpro/features/store/servier/product_service.dart';
// import 'package:octafitpro/features/store/widget/FoodCategory.dart';
// import 'package:octafitpro/features/store/widget/card_item.dart';
// import 'package:octafitpro/features/store/widget/search_field.dart';
// import 'package:octafitpro/features/store/widget/userheader.dart';

// class StoreView extends StatefulWidget {
//   const StoreView({super.key});

//   @override
//   State<StoreView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<StoreView> {
//   Future<void> getCategories() async {
//     try {
//       categories = await CategoryService().getCategories();

//       setState(() {});
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> getProducts() async {
//   try {

//     products = await ProductService().getProducts();

//     setState(() {});

//   } catch (e) {
//     print(e);
//   }
// }

//   @override
//   initState() {
//     super.initState();
//     getCategories();
//     getProducts();

//   }

//   // List category = ["All", "Supplemnets", "Equipment", "Clothes", "Accessories"];
//   List<CategoryModel> categories = [];
//   List<ProductModel> products = [];

//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xff0f1b3d),
//           surfaceTintColor: Colors.transparent,
//           elevation: 0,
//           iconTheme: const IconThemeData(
//             color: Colors.white, // لون سهم الرجوع
//           ),
//         ),

//         backgroundColor: AppColorsDark.primaryColor,

//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
//             ),
//           ),

//           child: CustomScrollView(
//             clipBehavior: Clip.none,
//             slivers: [
//               SliverAppBar(
//                 elevation: 0,
//                 pinned: true,
//                 floating: false,
//                 toolbarHeight: 150,
//                 scrolledUnderElevation: 0,
//                 backgroundColor: const Color(0xff0f1b3d),
//                 surfaceTintColor: Colors.transparent,
//                 automaticallyImplyLeading: false,

//                 iconTheme: const IconThemeData(color: Colors.white),

//                 flexibleSpace: ClipRRect(
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

//                     child: Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(0xff0f1b3d),
//                             Color(0xff16244f),
//                             Color(0xff1c2e63),
//                           ],
//                         ),
//                       ),

//                       child: const Padding(
//                         padding: EdgeInsets.only(top: 70, right: 20, left: 20),

//                         child: Column(children: [UserHeader()]),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15, right: 15),

//                   child: Column(
//                     children: [
//                       SearchField(),
//                       Gap(20),
//                       FoodCategory(
//                         onTap: (index) {
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },

//                         selectedIndex: selectedIndex,

//                         category: categories.map((e) => e.name).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               SliverPadding(
//                 padding: const EdgeInsets.only(top: 20, left: 15, right: 15),

//                 sliver: SliverGrid(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.73,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                   ),

//                   delegate: SliverChildBuilderDelegate(childCount: products.length, (
//                     context,
//                     index,
//                   ) {
//                     return GestureDetector(
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (c) => const ProductDetlsView(),
//                         ),
//                       ),

//                     final product = products[index];

// child: CardItem(
//   image: product.image
//       .replaceAll("127.0.0.1", "10.0.2.2"),

//   text: product.name,

//   desc: product.price,

//   rate: 4.5,
// );

//                   }),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/store/data/category_model.dart';
import 'package:octafitpro/features/store/data/product_mode.dart';
import 'package:octafitpro/features/store/servier/category_service.dart';
import 'package:octafitpro/features/product/view/product_detls_view.dart';
import 'package:octafitpro/features/store/servier/product_service.dart';
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
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  int selectedIndex = 0;

  Future<void> getCategories() async {
    try {
      categories = await CategoryService().getCategories();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProducts() async {
    try {
      products = await ProductService().getProducts();
      setState(() {});
    } catch (e) {
      e;
    }
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0f1b3d),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
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
                      child: const Padding(
                        padding: EdgeInsets.only(top: 70, right: 20, left: 20),
                        child: Column(children: [UserHeader()]),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      const SearchField(),
                      const Gap(20),
                      FoodCategory(
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        selectedIndex: selectedIndex,
                        category: categories.map((e) => e.name).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.73,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => const ProductDetlsView(),
                        ),
                      ),
                      child: CardItem(
                        image: product.image.replaceAll(
                          "127.0.0.1",
                          "10.0.2.2",
                        ),
                        text: product.name,
                        desc: product.price,
                      ),
                    );
                  }, childCount: products.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
