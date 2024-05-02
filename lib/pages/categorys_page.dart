import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorysPage extends ConsumerWidget {
  const CategorysPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final contracts = ref.watch(contractListProvier)

    return const Center(
      child: Text('CategorysPage'),
    );
  }
}
