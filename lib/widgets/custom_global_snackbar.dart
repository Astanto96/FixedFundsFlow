import 'package:flutter/material.dart';

class CustomGlobalSnackBar {
  final String text;
  //true == green, false == red, null == default
  final bool? isItGood;
  const CustomGlobalSnackBar(this.isItGood, {required this.text});

  static show(
    BuildContext context,
    String text,
    bool? isItGood,
  ) {
    Color backgroundColor;
    switch (isItGood) {
      case true:
        backgroundColor = Colors.green;
        break;
      case false:
        backgroundColor = Colors.red;
        break;
      case null:
        backgroundColor = Colors.blue;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
