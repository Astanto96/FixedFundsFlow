import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryFormDialog extends ConsumerStatefulWidget {
  const CategoryFormDialog({super.key});

  @override
  CategoryFormDialogState createState() => CategoryFormDialogState();
}

class CategoryFormDialogState extends ConsumerState<CategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
