import 'package:fixedfundsflow/config/config.dart';
import 'package:fixedfundsflow/provider/auth_provider.dart';
import 'package:fixedfundsflow/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixedFundsFlowApp extends ConsumerStatefulWidget {
  const FixedFundsFlowApp({super.key});

  @override
  FixedFundsFlowAppState createState() => FixedFundsFlowAppState();
}

class FixedFundsFlowAppState extends ConsumerState<FixedFundsFlowApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(authProvider.notifier).authenticate();
    });
  }

  @override
  Widget build(BuildContext context) {
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
