import 'package:calculator/data/key_data.dart';
import 'package:calculator/provider/display_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    var k = keyData.data;

    void onKeyTap(KeyConfig key) {
      var text = ref.read(focusedText.notifier);
      if (key.type == KeyType.number || key.type == KeyType.operator) {
        text.addText(key.name);
      } else {
        if (key.name == 'AC') {
          text.clearText();
        } else if (key.name == 'C') {
          text.deleteText();
        }
      }
    }

    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: const Color.fromARGB(255, 255, 255, 255),
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
                      ? Colors.grey
                      : k[i].color == 1
                          ? Colors.green
                          : Colors.red,
                  backgroundColor: k[i].color == 0
                      ? const Color.fromARGB(255, 250, 250, 250)
                      : k[i].color == 1
                          ? const Color.fromARGB(255, 235, 250, 244)
                          : const Color.fromARGB(255, 248, 217, 221),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  k[i].name,
                  style: TextStyle(
                    color: k[i].color == 0
                        ? const Color.fromARGB(255, 108, 108, 108)
                        : k[i].color == 1
                            ? const Color.fromARGB(255, 93, 204, 164)
                            : const Color.fromARGB(255, 208, 1, 27),
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
