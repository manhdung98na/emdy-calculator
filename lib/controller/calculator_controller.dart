import 'package:flutter/cupertino.dart';

class CalculatorController extends ChangeNotifier {
  static CalculatorController instance = CalculatorController._();

  CalculatorController._();

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
  late bool isContainOperator = false;

  List<String> get operators => ['+', '-', '*', '/'];

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
    notifyListeners();
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
      notifyListeners();
    }
  }

  void clear() {
    input = '';
    result = '';
    isContainOperator = false;
    notifyListeners();
  }

  void backspace() {
    input = input.substring(0, input.length - 1);
    notifyListeners();
  }
}
