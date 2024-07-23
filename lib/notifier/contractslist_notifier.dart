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
            category: Category(id: 7, description: "Living Expanses"),
            amount: 62000,
          ),
          Contract(
            id: 2,
            description: "mobile Phone",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 8, description: "Telekommunication"),
            amount: 5000,
          ),
          Contract(
            id: 3,
            description: "League of Legends",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 6, description: "Fun & Games"),
            amount: 2000,
          ),
          Contract(
            id: 4,
            description: "Paycheck",
            billingPeriod: BillingPeriod.monthly,
            category: Category(id: 2, description: "Income"),
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

  void updateContract(int id, Contract updatedVertrag) {
    state = [
      for (final vertrag in state)
        if (vertrag.id == id) updatedVertrag else vertrag,
    ];
  }

  void removeContract(int id) {
    state = state.where((vertrag) => vertrag.id != id).toList();
  }
}
