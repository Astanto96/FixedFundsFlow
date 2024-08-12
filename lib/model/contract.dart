import 'package:fixedfundsflow/model/billing_period.dart';
import 'package:fixedfundsflow/model/category.dart';

class Contract {
  int id;
  String description;
  BillingPeriod billingPeriod;
  Category category;
  bool income;
  int amount;

  Contract({
    required this.id,
    required this.description,
    required this.billingPeriod,
    required this.category,
    this.income = false,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'billingPeriod': billingPeriod.index,
      'category': category,
      'income': income,
      'amount': amount,
    };
  }

  factory Contract.fromMap(Map<String, dynamic> map) {
    return Contract(
      id: map['id'] as int,
      description: map['description'] as String,
      billingPeriod: BillingPeriod.values[map['billing_period'] as int],
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      income: map['income'] as bool,
      amount: map['amount'] as int,
    );
  }
}
