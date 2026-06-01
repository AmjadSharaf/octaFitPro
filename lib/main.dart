import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:octafitpro/core/global/them/app_theme.dart';
import 'package:octafitpro/core/network/dio_helper.dart';



import 'package:octafitpro/splash_view.dart';



void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // runApp(const MyApp());

  return runApp(
    EasyLocalization(
      saveLocale: true,
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // bool isDark = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Light Theme
      theme: AppTheme.lightTheme,

      // Dark Theme
      darkTheme: AppTheme.darkTheme,

      // System Theme
      themeMode: ThemeMode.light,

      // isDark
      // ? ThemeMode.dark
      // ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // theme: getthemDataDark(),
      home: SplashView(),
    );
  }
}
