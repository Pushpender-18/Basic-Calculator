import 'package:calculator/provider/display_provider.dart';
import 'package:calculator/provider/variable_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Display extends ConsumerWidget {
  const Display({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String msg = ref.watch(focusedText);
    final bool mode = ref.watch(theme);

    return Container(
      color: mode
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 24, 24, 24),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.bottomRight,
      height: height,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: () {
                if (mode == true) {
                  ref.watch(theme.notifier).dark();
                } else {
                  ref.watch(theme.notifier).light();
                }
              },
              icon: mode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(
                      Icons.light_mode_outlined,
                      color: Colors.white,
                    ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomRight,
            height: 100,
            child: Text(
              overflow: TextOverflow.visible,
              maxLines: 1,
              textAlign: TextAlign.left,
              msg,
              style: TextStyle(
                fontSize: msg.length < 9
                    ? 62
                    : msg.length < 13
                        ? 44
                        : 32,
                color: mode
                    ? const Color.fromARGB(255, 74, 74, 74)
                    : const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
