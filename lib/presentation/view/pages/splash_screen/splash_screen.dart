import 'package:flutter/material.dart';
import 'package:gemini_ai/Utils/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.instance.intropage,
      );
    });

    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("lib/assets/logo/logo2.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
