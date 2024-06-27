import 'package:fixedfundsflow/config/routes/route_location.dart';
import 'package:fixedfundsflow/model/contract.dart';
import 'package:flutter/material.dart';

class CustomOverviewListTile extends StatelessWidget {
  const CustomOverviewListTile({
    super.key,
    required this.contract,
  });

  final Contract contract;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RouteLocation.contractDetails, arguments: contract);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                contract.description,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                contract.amount.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
