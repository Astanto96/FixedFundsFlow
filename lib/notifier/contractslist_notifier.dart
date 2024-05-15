import 'package:fixedfundsflow/model/contract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VertragNotifier extends StateNotifier<List<Contract>> {
  VertragNotifier() : super([]);

  void addVertrag(Contract vertrag) {
    state = [...state, vertrag];
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
