import 'package:fixedfundsflow/model/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryslistNotifier extends StateNotifier<List<Category>> {
  CategoryslistNotifier() : super([]);

  void addCategory(Category category) {
    state = [...state, category];
  }

  void updateCategory(int id, Category updatedCategory) {
    state = [
      for (final category in state)
        if (category.id == id) updatedCategory else category
    ];
  }

  void removeCategory(int id) {
    state = state.where((category) => category.id != id).toList();
  }
}
