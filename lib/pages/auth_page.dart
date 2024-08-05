import 'package:fixedfundsflow/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You couldnt get Authenticated, please try again!"),
          IconButton(
            color: Colors.white,
            onPressed: () async {
              if (!authState.isAuthenticated) {
                await ref.read(authProvider.notifier).authenticate();
              }
            },
            icon: const Icon(Icons.redo),
          ),
        ],
      ),
    );
  }
}
