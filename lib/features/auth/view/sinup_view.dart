import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/features/auth/data/api_server.dart';
import 'package:octafitpro/features/auth/view/login_view.dart';
import 'package:octafitpro/features/auth/widget/custom_input_auth.dart';
import 'package:octafitpro/root.dart';
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
                Gap(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "  Full Name", color: Colors.white),
                    Gap(7),
                    CustomTxtfield(
                      iconperfex: Icon(Icons.person_2_outlined),
                      hint: "Name ... ",
                      isPassword: false,
                      controller: fullnameController,
                    ),
                  ],
                ),
                Gap(20),
                CustomInputAuth(
                  lable: "Email",
                  text: "your.email@octafitcom",
                  ispassword: false,
                  controller: emailController,
                ),
                Gap(20),
                CustomInputAuth(
                  lable: "password",
                  text: "Create a strong password",
                  ispassword: true,
                  controller: passwordController,
                ),

                Gap(25),
                CustomButton(
                  text: "Create Account ",
                  color: Color(0xffff7a3c),
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        final response = await AuthService().register(
                          name: fullnameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        print(response);

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text("Account Created Successfully"),
                        //   ),

                        return Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Root()),
                        );
                      } catch (e) {
                        print(e);

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("حدث خطأ")));
                      }
                    }
                  },
                ),

                Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Already have an account ?",
                      color: Color(0xffc7cbd9),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
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
