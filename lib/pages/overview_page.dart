import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/provider/contractslist_provider.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Contract> contracts = ref.watch(contractslistProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: const MenuDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        itemCount: contracts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(contracts[index].description),
            trailing: Text(contracts[index].amount.toString()),
          );
        },
      ),
    );
  }
}
