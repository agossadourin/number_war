import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_war/app/core/instances.dart';
import 'package:number_war/app/modules/principal/widgets/custom_keyboard.dart';
import 'package:number_war/app/modules/principal/widgets/custom_time_widget.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNumberController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Text("Guess the number that I'm thinking of:",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
            const SizedBox(height: 20),
            Obx(() => Text("between 1 and ${gameController.range}, ",
                style: const TextStyle(fontSize: 24))),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Score: ${gameController.score.value}',
                  style: const TextStyle(fontSize: 24),
                )),
            const SizedBox(height: 20),
            CustomTimeWidget(),
            const SizedBox(height: 20),
            /*TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your guess',
              ),
              onChanged: (value) {
                gameController.userNumber.value = int.tryParse(value) ?? 0;
              },
            ),*/

            CustomKeyboard(),
            const SizedBox(height: 20),
            Obx(() => gameController.isCorrect.value != 3
                ? Text(
                    gameController.isCorrect.value == 1
                        ? 'Correct!'
                        : gameController.isCorrect.value == 0
                            ? 'Entrez un nombre plus grand'
                            : 'Entrez un nombre plus petit',
                    style: TextStyle(
                      fontSize: 15,
                      color: gameController.isCorrect.value == 1
                          ? Colors.green
                          : Colors.red,
                    ),
                  )
                : const SizedBox()),
            const SizedBox(height: 20),
            Obx(() => gameController.isGameOver.value
                ? ElevatedButton(
                    onPressed: () {
                      gameController.resetGame();
                    },
                    child: const Text('Restart Game'),
                  )
                : Container()),
          ],
        ),
      ),
    );
  }
}
