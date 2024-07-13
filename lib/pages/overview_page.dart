import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/provider/contractslist_provider.dart';
import 'package:fixedfundsflow/widgets/contracts_header.dart';
import 'package:fixedfundsflow/widgets/contracts_listtile.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Contract> contracts = ref.watch(contractslistProvider);
    final int? totalIncome = contracts
        .where((contract) => contract.income)
        .map((contract) => contract.amount)
        .fold(0, ((previousValue, amount) => previousValue! + amount));
    final int totalExpanses = contracts
        .where((contract) => !contract.income)
        .map((contract) => contract.amount)
        .fold(0, (previousValue, amount) => previousValue + amount);
    final int? totalDifference =
        totalIncome! > 0 ? totalIncome - totalExpanses : null;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
              expanses: totalExpanses),
          //ListView for Contracts
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //will only take up as much space as needed.
            shrinkWrap: true,
            itemCount: contracts.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomContractsListTile(contract: contracts[index]);
            },
          ),
        ],
      ),
    );
  }
}
