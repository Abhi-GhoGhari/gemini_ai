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

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height * 0.2,
          width: size.width * 0.5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage("lib/assets/logo/logo2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
