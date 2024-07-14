import 'package:fixedfundsflow/provider/categoryslist_provider.dart';
import 'package:fixedfundsflow/widgets/custom_global_snackbar.dart';
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
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 260),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                "New Category",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter a Description",
                      ),
                      onSaved: (newValue) {
                        _description = newValue ?? "";
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a description";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                              foregroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.inversePrimary),
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                ref
                                    .read(categoryslistProvider.notifier)
                                    .addCategory(_description);
                                CustomGlobalSnackBar.show(context,
                                    "Category successfuly created!", true);
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Icon(Icons.add_task_rounded),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                              foregroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.inversePrimary),
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.close_rounded),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
