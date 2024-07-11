import 'package:fixedfundsflow/widgets/overview_header_container.dart';
import 'package:flutter/material.dart';

class OverviewHeader extends StatelessWidget {
  final int? income;
  final int? difference;
  final int expanses;
  const OverviewHeader(
      {super.key, this.income, this.difference, required this.expanses});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: OverviewHeaderContainer(title: "Income", amount: income),
        ),
        Expanded(
          child:
              OverviewHeaderContainer(title: "Difference", amount: difference),
        ),
        Expanded(
          child: OverviewHeaderContainer(
            title: "Expanses",
            amount: expanses,
          ),
        ),
      ],
    );
  }
}
