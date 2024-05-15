import 'package:fixedfundsflow/model/contract.dart';
import 'package:fixedfundsflow/notifier/contractslist_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contractlistProvider =
    StateNotifierProvider<VertragNotifier, List<Contract>>(
        (ref) => VertragNotifier());
