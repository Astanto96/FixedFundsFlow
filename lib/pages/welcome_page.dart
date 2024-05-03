import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      //BURGERMENU
      endDrawer: const MenuDrawer(),

      //INTRO-MITTIG
      body: const Center(
        child: Text('Hello Pogo Intro'),
      ),

      //FLOATINGBUTTON
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
