import 'package:fixedfundsflow/model/category.dart';
import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final Function(Category) onRemove;

  const CategoryListTile(
      {super.key, required this.category, required this.onRemove,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: ListTile(
          title: Text(category.description),
          trailing: IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              onRemove(category);
            },
          ),
          iconColor: Theme.of(context).colorScheme.inversePrimary,
          textColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
