import 'package:fixedfundsflow/model/category.dart';
import 'package:fixedfundsflow/provider/categoryslist_provider.dart';
import 'package:fixedfundsflow/widgets/category_form_dialog.dart';
import 'package:fixedfundsflow/widgets/category_listtile.dart';
import 'package:fixedfundsflow/widgets/custom_global_snackbar.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorysPage extends ConsumerStatefulWidget {
  const CategorysPage({super.key});

  @override
  CategorysPageState createState() => CategorysPageState();
}

class CategorysPageState extends ConsumerState<CategorysPage> {
  @override
  Widget build(BuildContext context) {
    final List<Category> categories = ref.watch(categoryslistProvider);

    void removeCategory(Category category) {
      setState(() {
        categories.remove(category);
        CustomGlobalSnackBar.show(
            context, "${category.description} got successfuly deleted", true,);
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: const MenuDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryListTile(
            category: categories[index],
            onRemove: removeCategory,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CategoryFormDialog();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
