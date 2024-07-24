class Statistic {
  final int totalExpenses;
  final int totalIncome;
  final Map<int, int> perCategoryExpenseSums;
  final Map<int, int> perCategoryIncomeSums;
  final Map<int, int> perCategoryContractCountInc;
  final Map<int, int> perCategoryContractCountExp;

  Statistic({
    required this.totalExpenses,
    required this.totalIncome,
    required this.perCategoryExpenseSums,
    required this.perCategoryIncomeSums,
    required this.perCategoryContractCountInc,
    required this.perCategoryContractCountExp,
  });
}
