import 'package:flutter/material.dart';
import 'package:number_war/app/core/instances.dart';

class CustomKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: gameController.textController,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKeyboardButton('1'),
            buildKeyboardButton('2'),
            buildKeyboardButton('3'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKeyboardButton('4'),
            buildKeyboardButton('5'),
            buildKeyboardButton('6'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKeyboardButton('7'),
            buildKeyboardButton('8'),
            buildKeyboardButton('9'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKeyboardButton('0'),
            ElevatedButton(
              onPressed: () {
                if (gameController.textController.text.isNotEmpty) {
                  gameController.textController.text =
                      gameController.textController.text.substring(
                          0, gameController.textController.text.length - 1);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Green color for Delete button
              ),
              child: Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () {
                gameController.userNumber.value =
                    int.tryParse(gameController.textController.text) ?? 0;
                gameController.checkNumber();
                gameController.checkGameOver();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Red color for Validate button
              ),
              child: Text('Validate'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildKeyboardButton(String value) {
    return ElevatedButton(
      onPressed: () {
        gameController.textController.text += value;
      },
      child: Text(value),
    );
  }
}
