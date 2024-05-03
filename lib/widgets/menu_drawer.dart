import 'package:fixedfundsflow/config/config.dart';
import 'package:fixedfundsflow/provider/language_provider.dart';
import 'package:fixedfundsflow/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(themeProvider);
    final String language = ref.watch(languageProvider);

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Expanded(
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
                  },
                ),
                ListTile(
                  title: const Text('Contracts'),
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteLocation.contracts);
                  },
                ),
                ListTile(
                  title: const Text('Categorys'),
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteLocation.categorys);
                  },
                ),
                ListTile(
                  title: const Text('Statistics'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteLocation.statisticsPage);
                  },
                ),
              ],
            ),
          ),
          // Toggle switches at the bottom
          const Divider(),
          ListTile(
            leading: IconButton(
              icon: Icon(theme.brightness == Brightness.dark
                  ? Icons.sunny
                  : Icons.nights_stay),
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
            title: Center(
              child: ToggleButtons(
                isSelected: [
                  language == 'de',
                  language == 'en',
                ],
                onPressed: (int index) {
                  ref
                      .read(languageProvider.notifier)
                      .switchLanguage(index == 0 ? 'de' : 'eng');
                },
                children: const <Widget>[
                  Text('DE'),
                  Text('ENG'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
