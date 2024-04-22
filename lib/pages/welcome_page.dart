import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              //acting like im pressed
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text('Hello Pogo Intro'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //acting like im pressed
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
