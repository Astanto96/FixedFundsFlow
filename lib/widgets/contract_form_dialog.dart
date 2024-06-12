import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart';
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
  String _description = ''; //Textfield
  BillingPeriod _billingPeriod = BillingPeriod.monthly; //Chipdings?
  DateTime? _contractStart; //Datepicker
  DateTime? _contractEnd; //Datepicker
  bool _openEnd = false; //Tickbox
  Category _category = Category(id: 1, description: "DummyCategory"); //Dropdown
  bool _income = false; //Tickbox
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        child: Form(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Billing Period',
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<BillingPeriod>(
                    value: _billingPeriod,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        _billingPeriod = newValue!;
                      });
                    },
                    items: BillingPeriod.values.map((BillingPeriod period) {
                      return DropdownMenuItem<BillingPeriod>(
                        value: period,
                        child: Text(period.toString().split('.').last),
                      );
                    }).toList(),
                  )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    ref.read(contractslistProvider.notifier).addContract(
                        _description,
                        _billingPeriod,
                        _contractStart,
                        _contractEnd,
                        _openEnd,
                        _category,
                        _income,
                        _amount);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Contract created")),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
