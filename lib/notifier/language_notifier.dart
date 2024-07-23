import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en');

  set language(String newLanguage) {
    state = newLanguage;
  }

  String get language => state;
}
