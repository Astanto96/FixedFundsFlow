import 'package:flutter/material.dart';

@immutable
class RouteLocation {
  // Private constructor to prevent instantiation.
  // This class provides named constants for route names used throughout the application.
  // By making the constructor private, we ensure that this class cannot be instantiated or extended,
  //turning it into a class that only provides static route names.
  const RouteLocation._();

  static String get home => '/home';
  static String get overview => '/overview';
  static String get contracts => '/contracts';
  static String get categorys => '/categorys';
  static String get statisticsPage => '/statisticsPage';
  static String get contractDetails => '/contractDetails';
}
