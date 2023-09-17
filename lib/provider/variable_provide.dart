import 'package:flutter_riverpod/flutter_riverpod.dart';

class Theme extends StateNotifier<bool> {
  Theme() : super(true);

  void dark() {
    state = false;
  }

  void light() {
    state = true;
  }
}

final theme = StateNotifierProvider<Theme, bool>((ref) => Theme());
