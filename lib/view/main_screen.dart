import 'package:emdy_calculator/components/button_widget.dart';
import 'package:emdy_calculator/components/result_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black87,
          ),
          child: Column(
            children: [
              const ResultWidget(),
              const Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonWidget(
                    text: 'Clear',
                    width: 130,
                    backgroundColor: Colors.cyan,
                  ),
                  ButtonWidget(
                    text: 'Backspace',
                    width: 130,
                    backgroundColor: Colors.cyan,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonWidget(text: '1'),
                  ButtonWidget(text: '2'),
                  ButtonWidget(text: '3'),
                  ButtonWidget(
                    text: '+',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonWidget(text: '4'),
                  ButtonWidget(text: '5'),
                  ButtonWidget(text: '6'),
                  ButtonWidget(
                    text: '-',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonWidget(text: '7'),
                  ButtonWidget(text: '8'),
                  ButtonWidget(text: '9'),
                  ButtonWidget(
                    text: '*',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonWidget(text: '0'),
                  ButtonWidget(text: '.'),
                  ButtonWidget(
                    text: '=',
                    backgroundColor: Colors.lightBlue,
                  ),
                  ButtonWidget(
                    text: '/',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
