import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Số hạng và phép toán mà người dùng nhập vào
  ///
  /// Ví dụ: 1 + 2
  late String input = '';

  /// Kết quả của phép toán
  late String result = '';

  /// Kiểm tra xem input đã chứa phép toán + - * / hay chưa
  ///
  /// ``true`` nếu đã tồn tại phép toán
  /// ``false`` nếu chưa
  late bool isContainOperator;

  List<String> get operators => ['+', '-', '*', '/'];

  @override
  void initState() {
    super.initState();
    input = '';
    result = '';
    isContainOperator = false;
  }

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
              buildResult(),
              const Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    'Clear',
                    width: 130,
                    backgroundColor: Colors.cyan,
                  ),
                  buildButton(
                    'Backspace',
                    width: 130,
                    backgroundColor: Colors.cyan,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton(
                    '+',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton(
                    '-',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton(
                    '*',
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('0'),
                  buildButton('.'),
                  buildButton(
                    '=',
                    backgroundColor: Colors.lightBlue,
                  ),
                  buildButton(
                    '/',
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

  Widget buildResult() {
    return Container(
      height: 150,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            input,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 26,
            ),
          ),
          Text(
            result,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    String text, {
    Color? backgroundColor,
    double? width,
    double? height,
  }) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      color: backgroundColor ?? Colors.blueGrey.shade700,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => handleTap(text),
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

  void handleTap(String text) {
    switch (text) {
      case '=':
        calculate();
        break;
      case 'Clear':
        clear();
        break;
      case 'Backspace':
        backspace();
        break;
      default:
        onClick(text);
    }
  }

  void onClick(String x) {
    if (operators.contains(x) && isContainOperator) {
      if (operators.contains(input[input.length - 1])) {
        input = input.substring(0, input.length - 1);
      } else {
        return;
      }
    }
    input += x;
    if (operators.contains(x)) {
      isContainOperator = true;
    }
    setState(() {});
  }

  void calculate() {
    try {
      String first = '', second = '';
      String? operator;
      for (int i = 0; i < input.length; i++) {
        if (operators.contains(input[i])) {
          operator = input[i];
        } else if (operator == null) {
          first += input[i];
        } else {
          second += input[i];
        }
      }

      if (operator == null) {
        result = first;
      } else {
        switch (operator) {
          case "+":
            result = (double.parse(first) + double.parse(second)).toString();
            break;
          case "-":
            result = (double.parse(first) - double.parse(second)).toString();
            break;
          case "*":
            result = (double.parse(first) * double.parse(second)).toString();
            break;
          case "/":
            result = (double.parse(first) / double.parse(second)).toString();
            break;
          default:
        }
      }

      input = result;
      isContainOperator = false;
    } catch (e) {
      result = 'Not valid';
    } finally {
      setState(() {});
    }
  }

  void clear() {
    setState(() {
      input = '';
      result = '';
      isContainOperator = false;
    });
  }

  void backspace() {
    setState(() {
      input = input.substring(0, input.length - 1);
    });
  }
}
