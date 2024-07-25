import 'package:fixedfundsflow/utils/amount_formatter.dart';
import 'package:flutter/widgets.dart';

class PieChartDescription extends StatelessWidget {
  const PieChartDescription({
    super.key,
    required this.categoryId,
    required this.categorySum,
    required this.contractCount,
    required this.categoryDescription,
  });

  final int categoryId;
  final int categorySum;
  final int contractCount;
  final String categoryDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Description
          Expanded(
            flex: 6,
            child: Text(
              categoryDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          //CategorySum
          Expanded(
            flex: 2,
            child: Text(
              AmountFormatter.formatToString(categorySum),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          //ContractsCount
          Expanded(
            child: Text(
              '$contractCount',
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
