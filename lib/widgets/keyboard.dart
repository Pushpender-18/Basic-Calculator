import 'package:calculator/data/key_data.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    final keyData = KeyData();

    return Container(
      height: height,
      color: Colors.black87,
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          for (int i = 0; i < keyData.length; i++)
            InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  keyData.value,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
