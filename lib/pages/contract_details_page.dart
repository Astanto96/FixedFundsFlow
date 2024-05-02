import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractDetailsPage extends ConsumerWidget {
  const ContractDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final contracts = ref.watch(contractListProvier)

    return const Center(
      child: Text('ContractDetailsPage'),
    );
  }
}
