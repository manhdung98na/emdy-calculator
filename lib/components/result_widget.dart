import 'package:emdy_calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CalculatorController.instance,
      child: Consumer<CalculatorController>(
        builder: (_, controller, ___) => Container(
          height: 150,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                controller.input,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 26,
                ),
              ),
              Text(
                controller.result,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
