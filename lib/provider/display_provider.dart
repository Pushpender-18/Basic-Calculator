import 'package:calculator/widgets/keyboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FocusedText extends StateNotifier<String> {
  FocusedText() : super('');

  void addText(String text) {
    if (state.length < 16) {
      if (state.isEmpty && operators.keys.contains(text)) {
        text = '';
      } else if (state.isNotEmpty) {
        if (operators.keys.contains(state[state.length - 1]) &&
            operators.keys.contains(text)) {
          state = state.substring(0, state.length - 1);
        } else if (text == '.') {
          int i = state.length;
          while (i > 0) {
            if (operators.keys.contains(state.substring(i - 1, i))) {
              state = state + text;
              text = '';
              break;
            } else if (state.substring(i - 1, i) == '.') {
              text = '';
              break;
            }
            i--;
          }
        } else if (state.substring(state.length - 1, state.length) == '.' &&
            text == '.') {
          text = '';
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
