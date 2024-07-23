import 'package:fixedfundsflow/config/routes/route_location.dart';
import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/utils/amount_formatter.dart';
import 'package:flutter/material.dart';

class CustomContractsListTile extends StatelessWidget {
  const CustomContractsListTile({
    super.key,
    required this.contract,
  });

  final Contract contract;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border(
              right: BorderSide(
                  width: 1.5,
                  color: contract.income ? Colors.green : Colors.red,),),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.of(context).pushNamed(RouteLocation.contractDetails,
                    arguments: contract,);
              });
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    contract.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    AmountFormatter.formatToString(contract.amount),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
