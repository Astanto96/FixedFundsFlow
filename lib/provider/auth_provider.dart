import 'package:fixedfundsflow/model/auth_state.dart';
import 'package:fixedfundsflow/notifier/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(LocalAuthentication());
});
