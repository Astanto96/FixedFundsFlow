import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart';

class Contract {
  int id;
  String description;
  BillingPeriod billingPeriod;
  DateTime? contractStart;
  DateTime? contractEnd;
  bool openEnd;
  Category category;
  bool income;
  int amount;

  Contract({
    required this.id,
    required this.description,
    required this.billingPeriod,
    this.contractStart,
    this.contractEnd,
    required this.openEnd,
    required this.category,
    this.income = false,
    required this.amount,
  });
}
