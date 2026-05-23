import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff13245B),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // USER CARD
              // =========================
              Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: const Color(0xff24386F),
                  borderRadius: BorderRadius.circular(22),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      height: 65,
                      width: 65,

                      decoration: BoxDecoration(
                        color: const Color(0xffFF7A30),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),

                    const Gap(15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "John Warrior",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Gap(4),

                          Text(
                            "john.warrior@email.com",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),

                          const Gap(10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xffFF7A30),
                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: const Text(
                              "PRO",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.settings_outlined,
                      color: Color(0xffFF7A30),
                    ),
                  ],
                ),
              ),

              const Gap(30),

              const Text(
                "Your Progress",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Gap(20),

              // =========================
              // STATS
              // =========================
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.trending_up,
                      iconColor: Colors.orange,
                      title: "127",
                      subtitle: "Workouts",
                    ),
                  ),

                  const Gap(12),

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.workspace_premium_outlined,
                      iconColor: Colors.green,
                      title: "21 days",
                      subtitle: "Streak",
                    ),
                  ),

                  const Gap(12),

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.calendar_month_outlined,
                      iconColor: Colors.blue,
                      title: "84",
                      subtitle: "Hours",
                    ),
                  ),
                ],
              ),

              const Gap(25),

              // =========================
              // PRO MEMBERSHIP
              // =========================
              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),

                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.withOpacity(0.35),
                      Colors.orange.withOpacity(0.25),
                    ],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.orange,
                    ),

                    const Gap(12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Pro Membership",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          Gap(5),

                          Text(
                            "Active until March 16, 2027",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.orange,
                      size: 18,
                    ),
                  ],
                ),
              ),

              const Gap(25),

              // =========================
              // MENU ITEMS
              // =========================
              _buildMenuItem(
                icon: Icons.workspace_premium_outlined,
                title: "Subscription",
                trailing: _buildProBadge(),
              ),

              _buildMenuItem(icon: Icons.trending_up, title: "Progress Stats"),

              _buildMenuItem(
                icon: Icons.inventory_2_outlined,
                title: "Order History",
              ),

              _buildMenuItem(icon: Icons.settings_outlined, title: "Settings"),
              const Gap(30),

              // =========================
              // LOGOUT
              // =========================
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff24386F),
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Color(0xffFF7A30)),

                      Gap(10),

                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xffFF7A30),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // STAT CARD
  // =========================

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 140,

      decoration: BoxDecoration(
        color: const Color(0xff24386F),
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,

            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(icon, color: iconColor),
          ),

          const Gap(15),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const Gap(5),

          Text(subtitle, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }

  // =========================
  // MENU ITEM
  // =========================

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),

        decoration: BoxDecoration(
          color: const Color(0xff24386F),
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(icon, color: Colors.white70),
            ),

            const Gap(15),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),

            trailing ??
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white38,
                  size: 18,
                ),
          ],
        ),
      ),
    );
  }

  // =========================
  // PRO BADGE
  // =========================

  Widget _buildProBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: const Color(0xffFF7A30),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
