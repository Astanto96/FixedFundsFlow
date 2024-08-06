import 'package:fixedfundsflow/config/config.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(_getInitialTheme());

  static ThemeData _getInitialTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? darkMode : lightMode;
  }

//state.brightness only can be dark or light, and this tells us wich Theme
//is currently active
  void toggleTheme() {
    state = (state.brightness == Brightness.dark) ? lightMode : darkMode;
  }
}
