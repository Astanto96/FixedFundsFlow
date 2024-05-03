import 'package:fixedfundsflow/config/config.dart';
import 'package:fixedfundsflow/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixedFundsFlowApp extends ConsumerWidget {
  const FixedFundsFlowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      title: "FixedFundsFlow",
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: RouteLocation.home,
      routes: getAppRoutes(),
    );
  }
}
