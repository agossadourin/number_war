import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_war/app/core/instances.dart';
import 'package:number_war/app/modules/principal/play/play_page.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Guess the Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.60,
                ),
              ),
              const SizedBox(
                height: 20, // Increased height for better spacing
                width: double.infinity,
              ),
              Obx(
                () => Text(
                  'Best score: ${gameController.bestScore.value}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54, // Set text color
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20, // Increased height for better spacing
                width: double.infinity,
              ),
              ElevatedButton(
                onPressed: () {
                  gameController.resetGame();
                  Get.to(() => const PlayPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
