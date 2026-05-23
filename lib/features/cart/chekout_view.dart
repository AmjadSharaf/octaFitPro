import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/features/cart/view/order_screen_view.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    double subtotal = 169.97;
    double shipping = 9.99;
    double discount = 16.99;

    double total = subtotal + shipping - discount;

    return Scaffold(
      backgroundColor: const Color(0xff0f1b3d),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // back
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },

                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 18,
                              ),

                              Gap(5),

                              Text(
                                "Back to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Gap(30),

                        // title
                        const Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Gap(35),

                        // delivery title
                        const Text(
                          "Delivery Address",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Gap(20),

                        // address card
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),

                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),

                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xff24386f).withOpacity(0.9),

                                    const Color(0xff314c99).withOpacity(0.9),
                                  ],
                                ),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.06),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),

                                      color: const Color(
                                        0xffff7b32,
                                      ).withOpacity(0.15),
                                    ),

                                    child: const Icon(
                                      Icons.location_on,
                                      color: Color(0xffff7b32),
                                      size: 28,
                                    ),
                                  ),

                                  const Gap(18),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        const Text(
                                          "Home",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const Gap(12),

                                        Text(
                                          "123 Fitness Street, Apt 4B\nNew York, NY 10001\nUnited States",

                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                              0.75,
                                            ),
                                            fontSize: 17,
                                            height: 1.6,
                                          ),
                                        ),

                                        const Gap(20),

                                        GestureDetector(
                                          onTap: () {},

                                          child: const Text(
                                            "Change Address",
                                            style: TextStyle(
                                              color: Color(0xffff7b32),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const Gap(35),

                        // payment title
                        const Text(
                          "Payment Method",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Gap(20),

                        // payment card
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),

                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),

                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xff24386f).withOpacity(0.9),

                                    const Color(0xff314c99).withOpacity(0.9),
                                  ],
                                ),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.06),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),

                                      color: const Color(
                                        0xffff7b32,
                                      ).withOpacity(0.15),
                                    ),

                                    child: const Icon(
                                      Icons.credit_card,
                                      color: Color(0xffff7b32),
                                      size: 28,
                                    ),
                                  ),

                                  const Gap(18),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        const Text(
                                          "Credit Card",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const Gap(10),

                                        Text(
                                          "•••• •••• •••• 4242",

                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            fontSize: 16,
                                          ),
                                        ),

                                        const Gap(20),

                                        GestureDetector(
                                          onTap: () {},

                                          child: const Text(
                                            "Change Payment",
                                            style: TextStyle(
                                              color: Color(0xffff7b32),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const Gap(35),

                        // order summary
                        const Text(
                          "Order Summary",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Gap(20),

                        // summary card
                        Container(
                          padding: const EdgeInsets.all(25),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff24386f).withOpacity(0.9),

                                const Color(0xff314c99).withOpacity(0.9),
                              ],
                            ),

                            border: Border.all(
                              color: Colors.white.withOpacity(0.06),
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),

                          child: Column(
                            children: [
                              buildPriceRow(
                                title: "Subtotal",
                                value: "\$${subtotal.toStringAsFixed(2)}",
                                color: Colors.white70,
                              ),

                              const Gap(18),

                              buildPriceRow(
                                title: "Shipping",
                                value: "\$${shipping.toStringAsFixed(2)}",
                                color: Colors.white70,
                              ),

                              const Gap(18),

                              buildPriceRow(
                                title: "Discount (10%)",
                                value: "-\$${discount.toStringAsFixed(2)}",
                                color: Colors.greenAccent,
                              ),

                              const Gap(20),

                              Divider(color: Colors.white.withOpacity(0.1)),

                              const Gap(20),

                              buildPriceRow(
                                title: "Total",
                                value: "\$${total.toStringAsFixed(2)}",

                                color: Colors.white,
                                isBold: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Gap(25),

                // place order button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderSuccessView(),
                      ),
                    );
                  },

                  child: Container(
                    height: 70,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),

                      gradient: const LinearGradient(
                        colors: [Color(0xff56b85d), Color(0xff63c968)],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: const Center(
                      child: Text(
                        "Place Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPriceRow({
    required String title,
    required String value,
    required Color color,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: isBold ? 24 : 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),

        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: isBold ? 24 : 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
