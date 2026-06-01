import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';
import 'package:octafitpro/core/network/dio_helper.dart';
import 'package:octafitpro/features/auth/data/auth_model.dart';
import 'package:octafitpro/features/auth/view/sinup_view.dart';
import 'package:octafitpro/root.dart';

import 'package:octafitpro/shared/custom_button.dart';
import 'package:octafitpro/shared/custom_text.dart';
import 'package:octafitpro/shared/custom_txtfield.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });

        Response response = await DioHelper.postData(
          url: 'login',
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );

        AuthModel loginModel = AuthModel.fromJson(response.data);

        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', loginModel.token);

        setState(() {
          isLoading = false;
        });

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Welcome ${loginModel.user.name}')),
        // );
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Root()),
        );

        // print(loginModel.token);
      } on DioException catch (e) {
        setState(() {
          isLoading = false;
        });

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.response?.data['message'] ?? 'Login Failed'),
          ),
        );

        // print(e.response?.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.primaryColor,

      body: Container(
        decoration: const BoxDecoration(
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

                const Gap(5),

                const CustomText(
                  text: "Sign in to continue your journey",
                  color: Color(0xffc7cbd9),
                ),

                const Gap(10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const CustomText(text: "  Email", color: Colors.white),

                    const Gap(7),

                    CustomTxtfield(
                      iconperfex: const Icon(Icons.email_outlined),

                      hint: "your.email@example.com",

                      isPassword: false,

                      controller: emailController,
                    ),
                  ],
                ),

                const Gap(40),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const CustomText(text: "  password", color: Colors.white),

                    const Gap(7),

                    CustomTxtfield(
                      iconperfex: const Icon(Icons.lock_outline_sharp),

                      hint: "Enter your password",

                      isPassword: true,

                      controller: passwordController,
                    ),
                  ],
                ),

                const Gap(12),

                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const Root()),
                    // );
                  },

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      CustomText(
                        text: "forgot Password?",
                        color: Color(0xffff7a3c),
                      ),
                    ],
                  ),
                ),

                const Gap(50),

                GestureDetector(
                  onTap: login,

                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const CustomButton(
                          text: "Log in ",
                          color: Color(0xffff7a3c),
                        ),
                ),

                const Gap(25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const CustomText(
                      text: "Don't have an account ?",
                      color: Color(0xffc7cbd9),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SinupView(),
                          ),
                        );
                      },

                      child: const CustomText(
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
