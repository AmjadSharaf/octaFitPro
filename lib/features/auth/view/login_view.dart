import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/shared/custom_button.dart';
import 'package:octafitpro/shared/custom_text.dart';
import 'package:octafitpro/shared/custom_txtfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColorsDark.primaryColor,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f1b3d), Color(0xff16244f), Color(0xff1c2e63)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SvgPicture.asset("assets/logo/logo.svg"),
                Gap(5),
                CustomText(
                  text: "Sign in to continue your journey",
                  color: Color(0xffc7cbd9),
                ),
                Gap(100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "  Email", color: Colors.white),
                    Gap(7),
                    CustomTxtfield(
                      iconperfex: Icon(Icons.email_outlined),
                      hint: "your.email@example.com",
                      isPassword: false,
                      controller: emailController,
                    ),
                  ],
                ),
                Gap(40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "  password", color: Colors.white),
                    Gap(7),
                    CustomTxtfield(
                      iconperfex: Icon(Icons.lock_outline_sharp),
                      hint: "Enter your password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                  ],
                ),
                Gap(12),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "forgot Password?",
                        color: Color(0xffff7a3c),
                      ),
                    ],
                  ),
                ),
                Gap(50),
                CustomButton(text: "Log in ", color: Color(0xffff7a3c)),
                Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account ?",
                      color: Color(0xffc7cbd9),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: "Sign Up ",
                        color: Color(0xffff7a3c),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
