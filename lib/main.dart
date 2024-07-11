import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_war/app/modules/principal/controllers/game_controller.dart';
import 'package:number_war/app/modules/principal/principal.dart';
import 'package:number_war/app/modules/splash_screens/splash_screen.dart';

void main() async {
  Get.put(GameController());
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late FlameSplashController controller;

  @override
  void initState() {
    controller = FlameSplashController(
      fadeInDuration: const Duration(seconds: 1),
      fadeOutDuration: const Duration(milliseconds: 250),
      waitDuration: const Duration(seconds: 5),
      autoStart: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // dispose it when necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Number War',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Inter',
      ),
      home: FlameSplashScreen(
        theme: FlameSplashTheme.dark,
        showBefore: (BuildContext context) {
          return const SplashScreen();
        },
        showAfter: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text(' Devinez le bon nombre pour avancer'),
            ),
          );
        },
        onFinish: (BuildContext context) => Get.to(() => const Principal()),
        controller: controller,
      ),
    );
  }
}
