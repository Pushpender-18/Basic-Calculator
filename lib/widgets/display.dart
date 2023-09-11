import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({super.key, required this.msg, required this.height});
  final String msg;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          width: 5,
          color: Colors.black12,
        ),
      ),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.bottomRight,
      height: height,
      width: double.infinity,
      child: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
