import 'package:fixedfundsflow/utils/amount_formatter.dart';
import 'package:flutter/material.dart';

class OverviewHeaderContainer extends StatelessWidget {
  final String title;
  final int? amount;
  const OverviewHeaderContainer({super.key, required this.title, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (amount != null) ...[
            Text(
              AmountFormatter.formatToString(amount!),
              style: const TextStyle(fontSize: 16),
            )
          ],
        ],
      ),
    );
  }
}
