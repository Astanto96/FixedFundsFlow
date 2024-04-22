import 'package:fixedfundsflow/config/theme/theme.dart';
import 'package:fixedfundsflow/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class FixedFundsFlowApp extends StatelessWidget {
  const FixedFundsFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const WelcomePage(),
    );
  }
}
