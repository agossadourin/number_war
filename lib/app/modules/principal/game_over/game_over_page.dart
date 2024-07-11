import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_war/app/core/instances.dart';
import 'package:number_war/app/modules/principal/principal.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87, // Set background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Game Over',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color
                ),
              ),
              const SizedBox(height: 16),
              if (gameController.score == gameController.bestScore)
                Text(
                  'Congratulations! New Best Score: ${gameController.bestScore}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.yellow, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  gameController.resetGame();
                  Get.back(); // Close the GameOverPage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Set button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Restart'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const Principal()); // Navigate to the main menu
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Main Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
