import 'package:calculator/widgets/display.dart';
import 'package:calculator/widgets/keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Display(msg: height.toString(), height: height / 2),
          Keyboard(height: height / 2),
        ],
      ),
    );
  }
}
