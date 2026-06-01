import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/store/data/category_model.dart';
import 'package:octafitpro/features/store/data/product_mode.dart';
import 'package:octafitpro/features/store/servier/category_service.dart';
import 'package:octafitpro/features/store/servier/product_service.dart';
import 'package:octafitpro/features/product/view/product_detls_view.dart';
import 'package:octafitpro/features/store/widget/food_category.dart';
import 'package:octafitpro/features/store/widget/card_item.dart';
import 'package:octafitpro/features/store/widget/search_field.dart';
import 'package:octafitpro/features/store/widget/userheader.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getCategories();
    getProducts();
  }

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
      filteredProducts = products; // أول تحميل
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void filterProducts(int index) {
    if (index == 0) {
      filteredProducts = products;
    } else {
      final categoryId = categories[index - 1].id;

      filteredProducts = products
          .where((product) => product.id == categoryId)
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColorsDark.primaryColor,

        appBar: AppBar(
          backgroundColor: const Color(0xff0f1b3d),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
            ),
          ),

          child: CustomScrollView(
            slivers: [
              /// HEADER
              SliverAppBar(
                pinned: true,
                toolbarHeight: 150,
                backgroundColor: const Color(0xff0f1b3d),
                automaticallyImplyLeading: false,
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
                        padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                        child: UserHeader(),
                      ),
                    ),
                  ),
                ),
              ),

              /// SEARCH + CATEGORIES
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SearchField(),
                      const Gap(20),

                      FoodCategory(
                        selectedIndex: selectedIndex,
                        category: categories.map((e) => e.name).toList(),
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });

                          filterProducts(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: Gap(20)),

              /// PRODUCTS GRID
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: filteredProducts.length,
                    (context, index) {
                      final product = filteredProducts[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) =>
                                  ProductDetlsView(product: product),
                            ),
                          );
                        },

                        child: CardItem(
                          image: product.image,
                          text: product.name,
                          price: product.price.toString(),
                          desc: product.description,
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
