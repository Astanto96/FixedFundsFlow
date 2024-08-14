import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/notifier/contractslist_notifier.dart';
import 'package:fixedfundsflow/provider/categoryslist_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contractslistProvider =
    StateNotifierProvider<ContractlistNotifier, List<Contract>>((ref) {
  final categorysList = ref.read(categoryslistProvider);
  return ContractlistNotifier(categorysList);
});
