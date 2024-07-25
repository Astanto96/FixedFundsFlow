import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart';
import 'package:fixedfundsflow/model/contract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractlistNotifier extends StateNotifier<List<Contract>> {
  ContractlistNotifier()
      : super([
          Contract(
            id: 1,
            description: "Rent for apartment",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 1, description: "Living Expanses"),
            amount: 62000,
          ),
          Contract(
            id: 2,
            description: "mobile Phone",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 2, description: "Telekommunication"),
            amount: 5000,
          ),
          Contract(
            id: 3,
            description: "League of Legends",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 3, description: "Fun & Games"),
            amount: 2000,
          ),
          Contract(
            id: 4,
            description: "Paycheck",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 4, description: "Income"),
            income: true,
            amount: 230000,
          ),
          Contract(
            id: 5,
            description: "Rent for apartment2",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 5, description: "Living Expanses2"),
            amount: 62000,
          ),
          Contract(
            id: 6,
            description: "mobile Phone2",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 6, description: "Telekommunication2"),
            amount: 5000,
          ),
          Contract(
            id: 7,
            description: "League of Legends2",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 3, description: "Fun & Games"),
            amount: 2000,
          ),
          Contract(
            id: 8,
            description: "Paycheck2",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 8, description: "Income2"),
            income: true,
            amount: 230000,
          ),
        ]);

  void addContract(
    String description,
    BillingPeriod billingPeriod,
    Category category,
    bool income,
    int amount,
  ) {
    final newContract = Contract(
      id: DateTime.now().millisecondsSinceEpoch,
      description: description,
      billingPeriod: billingPeriod,
      category: category,
      income: income,
      amount: amount,
    );
    state = [...state, newContract];
  }

  void updateContract(Contract updatedVertrag) {
    state = [
      for (final vertrag in state)
        if (vertrag.id == updatedVertrag.id) updatedVertrag else vertrag,
    ];
  }

  void removeContract(int id) {
    state = state.where((vertrag) => vertrag.id != id).toList();
  }

  int? showTotalIncome() {
    return state
        .where((vertrag) => vertrag.income)
        .map((vertrag) => vertrag.amount)
        .fold(0, (previousValue, amount) => previousValue! + amount);
  }

  int showTotalExpanses() {
    return state
        .where((vertrag) => !vertrag.income)
        .map((vertrag) => vertrag.amount)
        .fold(0, (previousValue, amount) => previousValue + amount);
  }

  int? showTotalDifference() {
    final totalIncome = showTotalIncome();
    final totalExpanse = showTotalExpanses();

    return totalIncome! > 0 ? totalIncome - totalExpanse : null;
  }
}
