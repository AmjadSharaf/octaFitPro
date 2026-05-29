import 'dart:async';

import 'package:flutter/material.dart';

class OrderSuccessView extends StatefulWidget {
  const OrderSuccessView({super.key});

  @override
  State<OrderSuccessView> createState() => _OrderSuccessViewState();
}

class _OrderSuccessViewState extends State<OrderSuccessView> {
  @override
  void initState() {
    super.initState();

    // بعد 5 ثواني ترجع تلقائياً
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff13245B),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // دائرة النجاح
            Container(
              height: 120,
              width: 120,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff5CC15A),

                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff5CC15A).withOpacity(0.5),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),

              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 70,
              ),
            ),

            const SizedBox(height: 35),

            // النص الرئيسي
            const Text(
              "Order Placed!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // النص الفرعي
            const Text(
              "Your order has been successfully placed",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),

            const SizedBox(height: 50),

            // لودينغ صغير
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
