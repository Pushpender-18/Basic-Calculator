import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({super.key, required this.msg, required this.height});
  final String msg;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.bottomRight,
      height: height,
      width: double.infinity,
    );
  }
}
