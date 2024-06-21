import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart' as catmodel;
import 'package:fixedfundsflow/provider/categoryslist_provider.dart';
import 'package:fixedfundsflow/provider/contractslist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractFormDialog extends ConsumerStatefulWidget {
  const ContractFormDialog({super.key});

  @override
  ContractFormState createState() => ContractFormState();
}

class ContractFormState extends ConsumerState<ContractFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  BillingPeriod _billingPeriod = BillingPeriod.monthly;
  bool _isIncome = false;
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    final categorysList = ref.watch(categoryslistProvider);
    catmodel.Category _selectedCategory = categorysList.first;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.fromLTRB(10, 60, 10, 60),
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  "New Contract",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter a Description",
                        ),
                        onSaved: (value) {
                          _description = value ?? "";
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
                          horizontal: 8, vertical: 16),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Billing Period',
                        ),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<BillingPeriod>(
                          hint: const Text("Choose Billing Period"),
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              _billingPeriod = newValue!;
                            });
                          },
                          items:
                              BillingPeriod.values.map((BillingPeriod period) {
                            return DropdownMenuItem<BillingPeriod>(
                              value: period,
                              child: Text(period.toString().split('.').last),
                            );
                          }).toList(),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Category",
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<catmodel.Category>(
                            hint: const Text("Choose Category"),
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCategory = newValue!;
                              });
                            },
                            items:
                                categorysList.map((catmodel.Category category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category.description),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "00,00€",
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the amount";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                    checkColor: Colors.green,
                                    value: _isIncome,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        _isIncome = newValue!;
                                      });
                                    }),
                                const Text(
                                  "Is it Income?",
                                  style: TextStyle(
                                    fontSize: 16.00,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            ref
                                .read(contractslistProvider.notifier)
                                .addContract(_description, _billingPeriod,
                                    _selectedCategory, _isIncome, _amount);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Contract created")),
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text("Create"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
