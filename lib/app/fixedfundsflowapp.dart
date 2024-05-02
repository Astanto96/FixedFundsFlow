import 'package:fixedfundsflow/config/routes/routes.dart';
import 'package:fixedfundsflow/config/theme/theme.dart';
import 'package:flutter/material.dart';

class FixedFundsFlowApp extends StatelessWidget {
  const FixedFundsFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FixedFundsFlow",
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      initialRoute: RouteLocation.home,
      routes: getAppRoutes(),
    );
  }
}
