import 'package:fixedfundsflow/config/routes/routes.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          //SETTINGSBUTTON
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
      //BURGERMENU
      drawer: const MenuDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,

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
