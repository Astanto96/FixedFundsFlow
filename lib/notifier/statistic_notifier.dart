import 'package:fixedfundsflow/model/category.dart';
import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/model/statistic.dart';
import 'package:fixedfundsflow/provider/categoryslist_provider.dart';
import 'package:fixedfundsflow/provider/contractslist_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticNotifier extends StateNotifier<Statistic> {
  StatisticNotifier(this.ref)
      : super(
          Statistic(
            totalExpenses: 0,
            totalIncome: 0,
            perCategoryExpenseSums: {},
            perCategoryIncomeSums: {},
            perCategoryContractCountInc: {},
            perCategoryContractCountExp: {},
          ),
        ) {
    final contracts = ref.watch(contractslistProvider);
    final categories = ref.watch(categoryslistProvider);
    _calculateSummary(contracts, categories);
  }

  final Ref ref;

  void _calculateSummary(List<Contract> contracts, List<Category> categories) {
    int totalExpenses = 0;
    int totalIncome = 0;
    final Map<int, int> categoryExpenseSums = {};
    final Map<int, int> categoryIncomeSums = {};
    final Map<int, int> categoryCountIncome = {};
    final Map<int, int> categoryCountExpense = {};

    for (final contract in contracts) {
      if (contract.income) {
        totalIncome += contract.amount;

        categoryIncomeSums.update(
          contract.category.id,
          (value) => value + contract.amount,
          ifAbsent: () => contract.amount,
        );

        categoryCountIncome.update(
          contract.category.id,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      } else {
        totalExpenses += contract.amount;

        categoryExpenseSums.update(
          contract.category.id,
          (value) => value + contract.amount,
          ifAbsent: () => contract.amount,
        );

        categoryCountExpense.update(
          contract.category.id,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
    }

    state = Statistic(
      totalExpenses: totalExpenses,
      totalIncome: totalIncome,
      perCategoryExpenseSums: categoryExpenseSums,
      perCategoryIncomeSums: categoryIncomeSums,
      perCategoryContractCountInc: categoryCountIncome,
      perCategoryContractCountExp: categoryCountExpense,
    );
  }
}