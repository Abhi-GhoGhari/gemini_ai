import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283739),
        leading: const CircleAvatar(),
      ),
      backgroundColor: const Color(0xff283739),
      body: const Padding(
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
