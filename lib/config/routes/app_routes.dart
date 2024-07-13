import 'package:flutter/material.dart';
import 'package:fixedfundsflow/pages/pages.dart';
import 'route_location.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    RouteLocation.home: (context) => const WelcomePage(),
    RouteLocation.contracts: (context) => const ContractsPage(),
    RouteLocation.categorys: (context) => const CategorysPage(),
    RouteLocation.statisticsPage: (context) => const StatisticsPage(),
    RouteLocation.contractDetails: (context) => const ContractDetailsPage(),
  };
}
