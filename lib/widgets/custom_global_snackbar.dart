import 'package:flutter/material.dart';

class CustomGlobalSnackBar {
  //true == green, false == red, null == default
  final bool? isItGood;
  final String text;
  const CustomGlobalSnackBar({this.isItGood, required this.text});

  static void show(
    BuildContext context,
    String text,
    bool? isItGood,
  ) {
    Color backgroundColor;
    switch (isItGood) {
      case true:
        backgroundColor = Colors.green;
      case false:
        backgroundColor = Colors.red;
      case null:
        backgroundColor = Colors.blue;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
