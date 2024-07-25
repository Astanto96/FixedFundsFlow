import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/provider/contractslist_provider.dart';
import 'package:fixedfundsflow/widgets/contracts_header.dart';
import 'package:fixedfundsflow/widgets/contracts_listtile.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractsPage extends ConsumerWidget {
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Contract> contracts = ref.watch(contractslistProvider);
    final int? totalIncome =
        ref.read(contractslistProvider.notifier).showTotalIncome();
    final int totalExpanses =
        ref.read(contractslistProvider.notifier).showTotalExpanses();
    final int? totalDifference =
        ref.read(contractslistProvider.notifier).showTotalDifference();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: const MenuDrawer(),
      body: Column(
        children: [
          ContractsHeader(
            income: totalIncome,
            difference: totalDifference,
            expanses: totalExpanses,
          ),
          //ListView for Contracts
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //will only take up as much space as needed.
              shrinkWrap: true,
              itemCount: contracts.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomContractsListTile(contract: contracts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
