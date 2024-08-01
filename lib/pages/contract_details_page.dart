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
  bool formIsEditable = false;

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
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                const Text(
                  "Contract Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.delete_forever_outlined),
                      iconSize: 30,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      onPressed: () {
                        ref
                            .read(contractslistProvider.notifier)
                            .removeContract(contract.id);
                        CustomGlobalSnackBar.show(
                          context,
                          "${contract.description} got successfuly deleted",
                          true,
                        );
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(RouteLocation.contracts);
                      },
                    ),
                  ),
                ),
              ],
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
                      enabled: formIsEditable,
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
                      decoration: InputDecoration(
                        enabled: formIsEditable,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) => value == null
                          ? 'please choose a billing period'
                          : null,
                      hint: const Text("Choose BillingPeriod"),
                      value: billingPeriod,
                      onChanged: formIsEditable
                          ? (newValue) => setState(() {
                                billingPeriod = newValue!;
                              })
                          : null,
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
                      decoration: InputDecoration(
                        enabled: formIsEditable,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null ? 'please choose a category' : null,
                      value: selectedCategory,
                      hint: const Text("Choose Category"),
                      onChanged: formIsEditable
                          ? (newValue) => setState(() {
                                selectedCategory = newValue;
                              })
                          : null,
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
                      decoration: InputDecoration(
                        enabled: formIsEditable,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
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
                                color: formIsEditable
                                    ? Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: isIncome,
                              onChanged: formIsEditable
                                  ? (bool newValue) => setState(() {
                                        isIncome = newValue;
                                      })
                                  : null,
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
                        enabled: formIsEditable,
                        border: const OutlineInputBorder(),
                        hintText: "00,00€",
                        prefixIcon: Icon(isIncome ? Icons.add : Icons.remove),
                        prefixIconColor: isIncome ? Colors.green : Colors.red,
                      ),
                      initialValue: AmountFormatter.formatToString(amount),
                      onSaved: (value) {
                        amount = AmountFormatter.formatToInt(value!);
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
                        if (formIsEditable)
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
                              setState(() {
                                formIsEditable = false;
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
                                }
                              });
                            },
                            child: const Icon(Icons.add_task_rounded),
                          )
                        else
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
                              setState(() {
                                formIsEditable = true;
                              });
                            },
                            child: const Icon(Icons.edit),
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
