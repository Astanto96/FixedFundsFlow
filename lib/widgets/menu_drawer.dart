import 'package:fixedfundsflow/config/routes/routes.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('DrawerHeader'),
          ),
          ListTile(
            title: const Text('Overview'),
            onTap: () {
              Navigator.of(context).pushNamed(RouteLocation.overview);
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Contracts'),
            onTap: () {
              Navigator.of(context).pushNamed(RouteLocation.contracts);
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Categorys'),
            onTap: () {
              Navigator.of(context).pushNamed(RouteLocation.categorys);
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Statistics'),
            onTap: () {
              Navigator.of(context).pushNamed(RouteLocation.statisticsPage);
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
