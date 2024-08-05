import 'package:fixedfundsflow/config/config.dart';
import 'package:fixedfundsflow/provider/auth_provider.dart';
import 'package:fixedfundsflow/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixedFundsFlowApp extends ConsumerWidget {
  const FixedFundsFlowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (authState.isAuthenticated == false) {
        await ref.read(authProvider.notifier).authenticate();
      }
    });

    final theme = ref.watch(themeProvider);

    return MaterialApp(
      title: "FixedFundsFlow",
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute:
          authState.isAuthenticated ? RouteLocation.home : RouteLocation.auth,
      routes: getAppRoutes(),
    );
  }
}
