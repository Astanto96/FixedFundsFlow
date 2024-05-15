import 'package:fixedfundsflow/model/category.dart';
import 'package:fixedfundsflow/notifier/categorys_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryslistProvider =
    StateNotifierProvider<CategoryslistNotifier, List<Category>>(
        (ref) => CategoryslistNotifier());
