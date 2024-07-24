import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> getSections(
  Map<int, int> categorySums,
  int total,
) {
  return categorySums.entries.map((entry) {
    final categoryId = entry.key;
    final amount = entry.value;
    final percentage = (amount / total) * 100;

    return PieChartSectionData(
      color: Colors.primaries[categoryId % Colors.primaries.length],
      value: amount.toDouble(),
      title: '${percentage.toStringAsFixed(1)}%',
      radius: 80,
      badgePositionPercentageOffset: 1.2,
    );
  }).toList();
}
