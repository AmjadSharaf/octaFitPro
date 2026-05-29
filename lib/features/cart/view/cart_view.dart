import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/features/cart/chekout_view.dart';
import 'package:octafitpro/features/cart/server/cart_service.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // List cartItems = [
    // {
    //   "title": "Premium Whey Protein",
    //   "price": 49.99,
    //   "qty": 2,
    //   "image": "https://images.unsplash.com/photo-1579722821273-0f6c7d44362f",
    // },

    // {
    //   "title": "Boxing Gloves Pro",
    //   "price": 89.99,
    //   "qty": 1,
    //   "image": "https://images.unsplash.com/photo-1517836357463-d25dfeac3438",
    // },

    // {
    //   "title": "Resistance Bands Set",
    //   "price": 29.99,
    //   "qty": 1,
    //   "image": "https://images.unsplash.com/photo-1518611012118-696072aa579a",
    // },
  // ];
final cartItems = CartService().items;
  // double get totalPrice {
  //   double total = 0;

  //   for (var item in cartItems) {
  //     total += item["price"] * item["qty"];
  //   }

  //   return total;
  // }
double get totalPrice => CartService().total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f1b3d),

      appBar: AppBar(
        backgroundColor: const Color(0xff0f1b3d),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
          ),
        ),

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: cartItems.length,

                itemBuilder: (context, index) {
                  final item = cartItems[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),

                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                        child: Container(
                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),

                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff24386f).withOpacity(0.9),
                                const Color(0xff314c99).withOpacity(0.9),
                              ],
                            ),

                            border: Border.all(
                              color: Colors.white.withOpacity(0.08),
                            ),
                          ),

                          child: Row(
                            children: [
                              // الصورة
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),

                                child: Container(
                                  height: 90,
                                  width: 90,
                                  color: Colors.white12,

                                  child: Image.network(
                                    item["image"] ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const Gap(15),

                              // المعلومات
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      item["title"] ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const Gap(10),

                                    Text(
                                      "\$${item["price"]}",
                                      style: const TextStyle(
                                        color: Color(0xffff7b32),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // التحكم بالعدد
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        CartService().removeItem(index);
                                      });
                                    },

                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Color(0xffff7b32),
                                    ),
                                  ),

                                  const Gap(20),

                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (item["qty"] > 1) {
                                              item["qty"]--;
                                            }
                                          });
                                        },

                                        child: Container(
                                          height: 40,
                                          width: 40,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),

                                            color: Colors.white.withOpacity(
                                              0.08,
                                            ),
                                          ),

                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),

                                      const Gap(15),

                                      Text(
                                        "${item["qty"]}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const Gap(15),

                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            item["qty"]++;
                                          });
                                        },

                                        child: Container(
                                          height: 40,
                                          width: 40,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),

                                            color: const Color(0xffff7b32),
                                          ),

                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // الجزء السفلي
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xff172a5a).withOpacity(0.95),

                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [
                  // promo code
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.06),
                    ),

                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_offer_outlined,
                          color: Colors.white54,
                        ),

                        const Gap(10),

                        const Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter promo code",
                              hintStyle: TextStyle(color: Colors.white54),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffff7b32),
                          ),

                          child: const Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Gap(25),

                  // subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtotal",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),

                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  const Gap(20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Gap(25),

                  // checkout button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutView()),
                      );
                    },

                    child: Container(
                      height: 65,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color(0xffff7b32),
                      ),

                      child: const Center(
                        child: Text(
                          "Proceed to Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
