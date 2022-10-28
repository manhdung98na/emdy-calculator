import 'package:emdy_calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.text,
      this.backgroundColor,
      this.width,
      this.height});

  final String text;

  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      color: backgroundColor ?? Colors.blueGrey.shade700,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: handleTap,
        child: Container(
          width: width ?? 60,
          height: height ?? 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  void handleTap() {
    switch (text) {
      case '=':
        CalculatorController.instance.calculate();
        break;
      case 'Clear':
        CalculatorController.instance.clear();
        break;
      case 'Backspace':
        CalculatorController.instance.backspace();
        break;
      default:
        CalculatorController.instance.onClick(text);
    }
  }
}
