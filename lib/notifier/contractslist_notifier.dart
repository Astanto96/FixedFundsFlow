import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart';
import 'package:fixedfundsflow/model/contract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractlistNotifier extends StateNotifier<List<Contract>> {
  ContractlistNotifier() : super([]);

  void addContract(
      String description,
      BillingPeriod billingPeriod,
      DateTime? contractStart,
      DateTime? contractEnd,
      bool openEnd,
      Category category,
      bool income,
      int amount) {
    final newContract = Contract(
        id: DateTime.now().millisecondsSinceEpoch,
        description: description,
        billingPeriod: billingPeriod,
        contractStart: contractStart,
        contractEnd: contractEnd,
        openEnd: openEnd,
        category: category,
        income: income,
        amount: amount);
    state = [...state, newContract];
  }

  void updateVertrag(int id, Contract updatedVertrag) {
    state = [
      for (final vertrag in state)
        if (vertrag.id == id) updatedVertrag else vertrag
    ];
  }

  void removeVertrag(int id) {
    state = state.where((vertrag) => vertrag.id != id).toList();
  }
}
