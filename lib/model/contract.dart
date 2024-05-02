import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart';

class Contract {
  String description;
  BillingPeriod billingPeriod;
  DateTime? contractStart;
  DateTime? contractEnd;
  bool openEnd;
  Category category;
  bool income;

  Contract({
    required this.description,
    required this.billingPeriod,
    this.contractStart,
    this.contractEnd,
    required this.openEnd,
    required this.category,
    required this.income,
  });
}
