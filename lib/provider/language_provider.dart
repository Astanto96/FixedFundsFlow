import 'package:fixedfundsflow/notifier/language_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, String>(
  (ref) => LanguageNotifier(),
);
