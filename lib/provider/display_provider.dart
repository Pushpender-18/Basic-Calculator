import 'package:flutter_riverpod/flutter_riverpod.dart';

class FocusedText extends StateNotifier<String> {
  FocusedText() : super('');

  void addText(String text) {
    state = state + text;
  }

  void clearText() {
    state = '';
  }

  void deleteText() {
    state = state.substring(0, state.length - 1);
  }
}

final focusedText =
    StateNotifierProvider<FocusedText, String>((ref) => FocusedText());
