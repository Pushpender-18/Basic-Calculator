import 'package:calculator/data/key_data.dart';
import 'package:calculator/provider/display_provider.dart';
import 'package:calculator/provider/variable_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<String, int> operators = {'+': 0, '-': 0, 'X': 1, '/': 1};

class Keyboard extends ConsumerStatefulWidget {
  const Keyboard({super.key, required this.height});
  final double height;

  @override
  ConsumerState<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends ConsumerState<Keyboard> {
  @override
  Widget build(BuildContext context) {
    final keyData = KeyData();
    final mode = ref.watch(theme);
    var k = keyData.data;

    List<String> numberExtractor(String equation) {
      List<String> equ = [];
      String temp = '';
      for (int i = 0; i < equation.length; i++) {
        if (operators.keys.contains(equation[i])) {
          if (temp != '') {
            equ.add(temp);
          }
          equ.add(equation[i]);
          temp = '';
        } else if (equation[i] == '(') {
          equ.add(equation[i]);
        } else if (equation[i] == ')') {
          equ.add(temp);
          equ.add(equation[i]);
          temp = '';
        } else {
          temp += equation[i];
        }
      }
      equ.add(temp);

      return equ;
    }

    List<String> toPrefix(String equ) {
      List<String> string = [];
      List<String> stack = [];
      List<String> equation = numberExtractor(equ);

      for (int i = 0; i < equation.length; i++) {
        if (operators.keys.contains(equation[i])) {
          if (stack.isNotEmpty) {
            for (int j = stack.length - 1; j >= 0; j--) {
              if (stack[j] == '(') {
                stack.add(equation[i]);
                break;
              } else if (operators[stack[j]]! >= operators[equation[i]]!) {
                string.add(stack[j]);
                stack.removeAt(j);
              } else {
                stack.add(equation[i]);
                break;
              }
            }
            if (stack.isEmpty) {
              stack.add(equation[i]);
            }
          } else {
            stack.add(equation[i]);
          }
        } else if (equation[i] == '(') {
          stack.add(equation[i]);
        } else if (equation[i] == ')') {
          int j = stack.length - 1;
          while (stack[j] != '(') {
            string.add(stack[j]);
            stack.removeAt(j);

            j--;
          }
          stack.removeAt(j);
        } else {
          string.add(equation[i]);
        }
      }
      if (stack.isNotEmpty) {
        int j = stack.length - 1;
        while (j >= 0) {
          string.add(stack[j]);
          stack.removeAt(j);
          j--;
        }
      }
      return string;
    }

    double evaluate(List<String> equation) {
      double result = 0;
      List<String> stack = [];
      double x, y;

      if (equation.length < 3) {
        result = double.parse(equation[0]);

        return result;
      }

      for (int i = 0; i < equation.length; i++) {
        if (operators.keys.contains(equation[i])) {
          x = double.parse(stack[stack.length - 2]);
          y = double.parse(stack[stack.length - 1]);

          switch (equation[i]) {
            case '+':
              result = x + y;
              break;
            case '-':
              result = x - y;
              break;
            case 'X':
              result = x * y;
              break;
            case '/':
              result = x / y;
              break;
            default:
              break;
          }
          stack = stack.sublist(0, stack.length - 2);
          stack.add(result.toString());
        } else {
          stack.add(equation[i]);
        }
      }

      return result;
    }

    void calculate(String equ) {
      List<String> equation = toPrefix(equ);
      equation.remove('');
      double result = evaluate(equation);
      int r = 0;
      if ((result * 10) % 10 == 0) {
        r = result.toInt();
        ref.read(focusedText.notifier).clearText();
        ref.read(focusedText.notifier).addText(r.toString());
      } else {
        ref.read(focusedText.notifier).clearText();
        ref.read(focusedText.notifier).addText(result.toStringAsFixed(2));
      }
    }

    void onKeyTap(KeyConfig key) {
      var text = ref.read(focusedText.notifier);
      if (key.type == KeyType.number || key.type == KeyType.operator) {
        text.addText(key.name);
      } else {
        if (key.name == 'AC') {
          text.clearText();
        } else if (key.name == 'C') {
          text.deleteText();
        } else if (key.name == '=') {
          calculate(ref.read(focusedText));
        }
      }
    }

    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: mode
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 24, 24, 24),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          for (int i = 0; i < keyData.length; i++)
            InkWell(
              onTap: () {},
              child: TextButton(
                onPressed: () {
                  onKeyTap(k[i]);
                },
                style: TextButton.styleFrom(
                  foregroundColor: k[i].color == 0
                      ? (mode ? Colors.grey : Colors.grey)
                      : k[i].color == 1
                          ? (mode ? Colors.green : Colors.grey[350])
                          : (mode ? Colors.red : Colors.white),
                  backgroundColor: k[i].color == 0
                      ? (mode
                          ? const Color.fromARGB(255, 250, 250, 250)
                          : const Color.fromARGB(255, 24, 24, 24))
                      : k[i].color == 1
                          ? (mode
                              ? const Color.fromARGB(255, 235, 250, 244)
                              : const Color.fromARGB(255, 49, 49, 49))
                          : (mode
                              ? const Color.fromARGB(255, 248, 217, 221)
                              : const Color.fromARGB(255, 109, 109, 109)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  k[i].name,
                  style: TextStyle(
                    color: k[i].color == 0
                        ? (mode
                            ? const Color.fromARGB(255, 108, 108, 108)
                            : const Color.fromARGB(255, 190, 190, 190))
                        : k[i].color == 1
                            ? (mode
                                ? const Color.fromARGB(255, 93, 204, 164)
                                : const Color.fromARGB(255, 255, 255, 255))
                            : (mode
                                ? const Color.fromARGB(255, 208, 1, 27)
                                : const Color.fromARGB(255, 255, 255, 255)),
                    fontSize: 24,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
