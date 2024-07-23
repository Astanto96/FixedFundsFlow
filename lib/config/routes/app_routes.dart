import 'package:fixedfundsflow/config/routes/route_location.dart';
import 'package:fixedfundsflow/pages/pages.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    RouteLocation.home: (context) => const WelcomePage(),
    RouteLocation.contracts: (context) => const ContractsPage(),
    RouteLocation.categorys: (context) => const CategorysPage(),
    RouteLocation.statisticsPage: (context) => const StatisticsPage(),
    RouteLocation.contractDetails: (context) => const ContractDetailsPage(),
  };
}
