import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/auth/widget/custom_input_auth.dart';
import 'package:octafitpro/shared/custom_button.dart';
import 'package:octafitpro/shared/custom_text.dart';
import 'package:octafitpro/shared/custom_txtfield.dart';

class SinupView extends StatelessWidget {
  const SinupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController fullnameController = TextEditingController();
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
                    CustomText(text: "  Full Name", color: Colors.white),
                    Gap(7),
                    CustomTxtfield(
                      iconperfex: Icon(Icons.person_2_outlined),
                      hint: "Amjad and Adib ",
                      isPassword: false,
                      controller: fullnameController,
                    ),
                  ],
                ),
                Gap(40),
                CustomInputAuth(
                  lable: "Email",
                  text: "your.email@octafitcom",
                  ispassword: false,
                  controller: emailController,
                ),
                Gap(40),
                CustomInputAuth(
                  lable: "password",
                  text: "Create a strong password",
                  ispassword: true,
                  controller: passwordController,
                ),

                Gap(50),
                CustomButton(text: "Create Account ", color: Color(0xffff7a3c)),
                Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Already have an account ?",
                      color: Color(0xffc7cbd9),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: "Sign In ",
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
