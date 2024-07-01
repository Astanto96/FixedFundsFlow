import 'package:fixedfundsflow/config/config.dart';
import 'package:fixedfundsflow/widgets/menu_drawer_bot_listtile.dart';
import 'package:fixedfundsflow/widgets/menu_drawer_listtile.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void goToRoute(String routeLocation) {
      Navigator.pop(context);
      Navigator.of(context).pushNamed(routeLocation);
    }

    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 64,
                    ),
                  ),
                  MenuDrawerListTile(
                    icon: Icons.euro_symbol_rounded,
                    text: "O V E R V I E W",
                    onTap: () {
                      goToRoute(RouteLocation.overview);
                    },
                  ),
                  MenuDrawerListTile(
                    icon: Icons.description_outlined,
                    text: "C O N T R A C T S",
                    onTap: () {
                      goToRoute(RouteLocation.contracts);
                    },
                  ),
                  MenuDrawerListTile(
                    icon: Icons.query_stats,
                    text: 'S T A T I S T I C S',
                    onTap: () {
                      goToRoute(RouteLocation.statisticsPage);
                    },
                  ),
                  MenuDrawerListTile(
                    icon: Icons.category_outlined,
                    text: "C A T E G O R Y S",
                    onTap: () {
                      goToRoute(RouteLocation.categorys);
                    },
                  ),
                ],
              ),
            ),
            // Toggle switches at the bottom
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: MenuDrawerBotListTile(),
            )
          ],
        ),
      ),
    );
  }
}
