import 'package:fixedfundsflow/model/statistic.dart';
import 'package:fixedfundsflow/notifier/statistic_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statisticProvider = StateNotifierProvider<StatisticNotifier, Statistic>(
  (ref) => StatisticNotifier(ref),
);
