import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/services/database_service.dart';

class ContractFactory {
  final DatabaseService _databaseService;

  ContractFactory(this._databaseService);

  Future<Contract> createContract({required Contract contract}) async {
    final contractMap = contract.toMap();
    final db = await _databaseService.database;
    final id = await db.insert('contracts', contractMap);
    return Contract(
      id: id,
      description: contract.description,
      billingPeriod: contract.billingPeriod,
      category: contract.category,
      income: contract.income,
      amount: contract.amount,
    );
  }
}
