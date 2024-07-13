import 'package:fixedfundsflow/widgets/contracts_header_container.dart';
import 'package:flutter/material.dart';

class ContractsHeader extends StatelessWidget {
  final int? income;
  final int? difference;
  final int expanses;
  const ContractsHeader(
      {super.key, this.income, this.difference, required this.expanses});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: ContractsOverviewContainer(title: "Income", amount: income),
        ),
        Expanded(
          child: ContractsOverviewContainer(
              title: "Difference", amount: difference),
        ),
        Expanded(
          child: ContractsOverviewContainer(
            title: "Expanses",
            amount: expanses,
          ),
        ),
      ],
    );
  }
}
