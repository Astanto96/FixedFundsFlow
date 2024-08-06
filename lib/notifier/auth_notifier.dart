import 'package:fixedfundsflow/model/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LocalAuthentication _auth;

  AuthNotifier(this._auth) : super(AuthState.initial());

//check if Biometrics are available
//if yes, do them
//if no, check without biometrics
  Future<void> authenticate() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();

    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await _auth.authenticate(
          localizedReason: 'Please authenticate to access the app',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        state = AuthState(isAuthenticated: didAuthenticate);
      } catch (e) {
        state = AuthState(isAuthenticated: false);
      }
    } else {
      state = AuthState(isAuthenticated: false);
    }
  }
}
