import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/services/contract_factory.dart';
import 'package:fixedfundsflow/services/database_service.dart';

class ContractService {
  final DatabaseService _databaseService;
  late final ContractFactory _contractFactory;

  ContractService(this._databaseService) {
    _contractFactory = ContractFactory(_databaseService);
  }

  Future<Contract> addContract(Contract contract) async {
    final newContract =
        await _contractFactory.createContract(contract: contract);

    return newContract;
  }

  Future<List<Contract>> getContracts() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('contracts');

    return List.generate(maps.length, (i) {
      return Contract.fromMap(maps[i]);
    });
  }

  Future<int> updateContract(Contract contract) async {
    final db = await _databaseService.database;
    return await db.update(
      'contracts',
      contract.toMap(),
      where: 'id = ?',
      whereArgs: [contract.id],
    );
  }

  Future<int> deleteContract(int id) async {
    final db = await _databaseService.database;
    return await db.delete(
      'contracts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
