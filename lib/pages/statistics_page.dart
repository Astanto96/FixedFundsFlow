import 'package:fixedfundsflow/provider/statistic_provider.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:fixedfundsflow/widgets/pie_chart_description.dart';
import 'package:fixedfundsflow/widgets/pie_chart_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(statisticProvider);
    final total = statistics.totalExpenses;
    final categorySums = statistics.perCategoryExpenseSums;
    final contractCounts = statistics.perCategoryContractCountExp;
    final categoryDescriptions = statistics.categoryDescriptions;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: const MenuDrawer(),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: PieChartStatistics(
                categorySums: categorySums,
                total: total,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categorySums.length,
              itemBuilder: (context, index) {
                final categoryId = categorySums.keys.elementAt(index);
                final categorySum = categorySums[categoryId]!;
                final contractCount = contractCounts[categoryId]!;
                final categoryDescription = categoryDescriptions[categoryId]!;

                return PieChartDescription(
                  categoryId: categoryId,
                  categorySum: categorySum,
                  contractCount: contractCount,
                  categoryDescription: categoryDescription,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
