import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_war/app/core/instances.dart';

class CustomTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(() {
          double progress = gameController.remainingTime.value /
              gameController.totalTime.value;
          Color progressColor = ColorTween(begin: Colors.green, end: Colors.red)
              .transform(1 - progress)!;

          return Container(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              value: progress,
              strokeWidth: 30,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          );
        }),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Obx(() => Text(
                  '${(gameController.remainingTime.value / 1000).toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
