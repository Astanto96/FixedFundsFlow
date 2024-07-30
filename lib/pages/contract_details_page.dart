import 'package:fixedfundsflow/config/routes/route_location.dart';
import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart' as catmodel;
import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/provider/categoryslist_provider.dart';
import 'package:fixedfundsflow/provider/contractslist_provider.dart';
import 'package:fixedfundsflow/utils/amount_formatter.dart';
import 'package:fixedfundsflow/widgets/custom_global_snackbar.dart';
import 'package:fixedfundsflow/widgets/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractDetailsPage extends ConsumerStatefulWidget {
  const ContractDetailsPage({super.key});

  @override
  ContractDetailsState createState() => ContractDetailsState();
}

class ContractDetailsState extends ConsumerState<ContractDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Contract contract =
        ModalRoute.of(context)!.settings.arguments! as Contract;
    final categorysList = ref.watch(categoryslistProvider);
    String description = contract.description;
    BillingPeriod billingPeriod = contract.billingPeriod;
    bool isIncome = contract.income;
    int amount = contract.amount;
    catmodel.Category? selectedCategory = contract.category;

    if (!categorysList.contains(selectedCategory)) {
      selectedCategory = null;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: const MenuDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete_forever_outlined),
              onPressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "Contract Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter a Description",
                      ),
                      initialValue: description,
                      onSaved: (newValue) {
                        description = newValue ?? "";
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
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: DropdownButtonFormField<BillingPeriod>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value == null
                          ? 'please choose a billing period'
                          : null,
                      hint: const Text("Choose BillingPeriod"),
                      value: billingPeriod,
                      onChanged: (newValue) {
                        setState(() {
                          billingPeriod = newValue!;
                        });
                      },
                      items: BillingPeriod.values
                          .map(
                            (period) => DropdownMenuItem(
                              value: period,
                              child: Text(period.name),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: DropdownButtonFormField<catmodel.Category>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null ? 'please choose a category' : null,
                      value: selectedCategory,
                      hint: const Text("Choose Category"),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categorysList
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.description),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.5,
                          horizontal: 8,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              "Is it Income?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: isIncome,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isIncome = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "00,00€",
                        prefixIcon: Icon(isIncome ? Icons.add : Icons.remove),
                        prefixIconColor: isIncome ? Colors.green : Colors.red,
                      ),
                      initialValue: AmountFormatter.formatToString(amount),
                      onSaved: (value) {
                        amount = int.parse(value!);
                        //Achtung, nochmal komplett überarbeiten!
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the amount";
                          //Überarbeiten!
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 38,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.inversePrimary,
                            ),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 30,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              contract.amount = amount;
                              contract.billingPeriod = billingPeriod;
                              contract.category = selectedCategory!;
                              contract.description = description;
                              contract.income = isIncome;

                              ref
                                  .read(contractslistProvider.notifier)
                                  .updateContract(contract);
                              CustomGlobalSnackBar.show(
                                context,
                                "$description got successfuly updated!",
                                true,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(RouteLocation.contracts);
                            }
                          },
                          child: const Icon(Icons.add_task_rounded),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.inversePrimary,
                            ),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 30,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
