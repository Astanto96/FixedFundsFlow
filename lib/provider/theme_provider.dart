import 'package:fixedfundsflow/notifier/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) => ThemeNotifier());
