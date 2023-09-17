import 'package:calculator/widgets/keyboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FocusedText extends StateNotifier<String> {
  FocusedText() : super('');

  void addText(String text) {
    if (state.length < 16) {
      if (state.isNotEmpty) {
        if (operators.keys.contains(state[state.length - 1]) &&
            operators.keys.contains(text)) {
          state = state.substring(0, state.length - 1);
        }
      }
      state = state + text;
    }
  }

  void clearText() {
    state = '';
  }

  void deleteText() {
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }
}

final focusedText =
    StateNotifierProvider<FocusedText, String>((ref) => FocusedText());
