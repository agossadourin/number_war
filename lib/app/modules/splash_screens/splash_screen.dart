import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_war/app/modules/principal/principal.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    // Replace the below line with the screen you want to navigate to after the splash screen
    Get.to(() => const Principal());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFD83F41),
      body: Center(
        child: Text(
          'Number War',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            letterSpacing: -0.60,
          ),
        ),
      ),
    );
  }
}
