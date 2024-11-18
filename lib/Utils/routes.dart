import 'package:flutter/cupertino.dart';
import 'package:gemini_ai/presentation/view/pages/Home_Page/Home_Page.dart';
import 'package:gemini_ai/presentation/view/pages/Intro_Page/Intro_Page.dart';
import 'package:gemini_ai/presentation/view/pages/Splash_Screen/Splash_Screen.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String splashscreen = '/';
  String intropage = 'intro_page';
  String homepage = 'home_page';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const SplashScreen(),
    'intro_page': (context) => const IntroPage(),
    'home_page': (context) => const HomePage(),
  };
}
