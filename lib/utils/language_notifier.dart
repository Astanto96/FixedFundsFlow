import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en');

  void switchLanguage(String newLanguage) {
    state = newLanguage;
  }
}
