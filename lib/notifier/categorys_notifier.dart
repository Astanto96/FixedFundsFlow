import 'package:fixedfundsflow/model/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryslistNotifier extends StateNotifier<List<Category>> {
  CategoryslistNotifier()
      : super([
          Category(id: 1, description: 'Category 1'),
          Category(id: 2, description: 'Category 2'),
          Category(id: 3, description: 'Category 3'),
          Category(id: 4, description: 'Category 4'),
          Category(id: 5, description: 'Category 5'),
          Category(id: 6, description: 'Category 6')
        ]);

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
