import 'package:fixedfundsflow/utils/pie_chart_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class PieChartStatistics extends StatelessWidget {
  const PieChartStatistics({
    super.key,
    required this.categorySums,
    required this.total,
  });

  final Map<int, int> categorySums;
  final int total;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: getSections(
          categorySums,
          total,
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 4,
        centerSpaceRadius: 90,
      ),
    );
  }
}
