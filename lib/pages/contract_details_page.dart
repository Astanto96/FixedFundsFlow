import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractDetailsPage extends ConsumerWidget {
  const ContractDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Contract contract =
        ModalRoute.of(context)?.settings.arguments as Contract;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: const MenuDrawer(),
      body:
          Center(child: Text('Contract_DetailsPage! ${contract.description}')),
    );
  }
}
