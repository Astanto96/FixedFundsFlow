import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractsPage extends ConsumerWidget {
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final contracts = ref.watch(contractListProvier)

    return const Center(
      child: Text('ContractsPage'),
    );
  }
}
