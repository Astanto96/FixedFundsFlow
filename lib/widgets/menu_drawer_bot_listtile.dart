import 'package:fixedfundsflow/provider/language_provider.dart';
import 'package:fixedfundsflow/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDrawerBotListTile extends ConsumerWidget {
  const MenuDrawerBotListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(themeProvider);
    final String language = ref.watch(languageProvider);

    return Row(
      children: [
        IconButton(
          icon: Icon(
            theme.brightness == Brightness.dark
                ? Icons.sunny
                : Icons.nights_stay,
          ),
          onPressed: () {
            ref.read(themeProvider.notifier).toggleTheme();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: ToggleButtons(
            renderBorder: false,
            isSelected: [
              language == 'de',
              language == 'en',
            ],
            onPressed: (int index) {
              ref.read(languageProvider.notifier).language =
                  (index == 0 ? 'de' : 'en');
            },
            children: const <Widget>[
              Text('DE'),
              Text('ENG'),
            ],
          ),
        ),
      ],
    );
  }
}
