import 'dart:async';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:number_war/app/modules/principal/game_over/game_over_page.dart';

class GameController extends GetxController {
  static GameController instance = Get.find();

  var bestScore = 0.obs;
  var range = 10.obs;
  var score = 0.obs;
  var number = 0.obs;
  var userNumber = 0.obs;
  var isCorrect = 0.obs;
  var isGameOver = false.obs;
  var remainingTime = 60000.obs;
  var totalTime = 60000.obs;
  Timer _timer = Timer(Duration.zero, () {});
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void generateNumber() {
    //GENERATE A RANDOM NUMBER BETWEEN 1 AND 10. change range when score is higher
    range.value = 10 +
        (score.value ~/ 2) *
            10; // Increase range by 10 for every 10 points scored
    number.value = Random().nextInt(range.value) + 1;
    print("Number: ${number.value}");
  }

  void checkNumber() {
    if (userNumber.value == number.value) {
      score.value++;
      isCorrect.value = 1;
      remainingTime.value += 10000; // Add 10 seconds to the timer
      totalTime.value += 10000;

      generateNumber();
    } else {
      if (userNumber.value < number.value) {
        isCorrect.value = 0;
      }
      if (userNumber.value > number.value) {
        isCorrect.value = 2;
      }
    }
    //change isCorrect value to 3 after 2 seconds
    textController.clear();
    Future.delayed(const Duration(seconds: 2), () {
      isCorrect.value = 3;
    });
  }

  void checkGameOver() {
    if (remainingTime.value <= 0) {
      isGameOver.value = true;
      Get.to(() => const GameOverPage());
      bestScore.value =
          bestScore.value < score.value ? score.value : bestScore.value;
      _timer.cancel(); // Stop the timer
    }
  }

  void resetGame() {
    score.value = 0;
    isCorrect.value = 3;
    isGameOver.value = false;
    remainingTime.value = 60000;
    totalTime.value = 60000;
    generateNumber();
    startTimer();
  }

  void startTimer() {
    _timer.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value -= 100;
      } else {
        checkGameOver();
      }
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
