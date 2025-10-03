import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  // Push named route
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  // Push named route and replace current
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments, Object? result}) {
    return Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  // Push named route and remove all previous routes
  Future<dynamic> pushNamedAndRemoveUntil(
      String routeName,
      bool Function(Route<dynamic>) predicate, {
        Object? arguments,
      }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  // Pop until predicate is true
  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  // Pop current route
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  // Check if can pop
  bool canPop() {
    return Navigator.of(this).canPop();
  }

  // Maybe pop (pop only if can pop)
  Future<bool> maybePop<T>([T? result]) {
    return Navigator.of(this).maybePop(result);
  }

  // Push route (with custom route)
  Future<T?> push<T>(Route<T> route) {
    return Navigator.of(this).push(route);
  }

  // Push replacement (with custom route)
  Future<T?> pushReplacement<T, TO>(Route<T> route, {TO? result}) {
    return Navigator.of(this).pushReplacement(route, result: result);
  }

  // Push and remove until (with custom route)
  Future<T?> pushAndRemoveUntil<T>(
      Route<T> route,
      bool Function(Route<dynamic>) predicate,
      ) {
    return Navigator.of(this).pushAndRemoveUntil(route, predicate);
  }

  // Remove route
  void removeRoute(Route<dynamic> route) {
    Navigator.of(this).removeRoute(route);
  }

  // Remove route below
  void removeRouteBelow(Route<dynamic> anchorRoute) {
    Navigator.of(this).removeRouteBelow(anchorRoute);
  }

  // Replace route
  void replace<T>({required Route<dynamic> oldRoute, required Route<T> newRoute}) {
    Navigator.of(this).replace(oldRoute: oldRoute, newRoute: newRoute);
  }

  // Replace route below
  void replaceRouteBelow<T>({required Route<dynamic> anchorRoute, required Route<T> newRoute}) {
    Navigator.of(this).replaceRouteBelow(anchorRoute: anchorRoute, newRoute: newRoute);
  }

  // Pop and push named
  Future<T?> popAndPushNamed<T, TO>(String routeName, {TO? result, Object? arguments}) {
    return Navigator.of(this).popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  // Restore route
  void restorableReplace<T>({
    required Route<dynamic> oldRoute,
    required Route<T> newRoute,
  }) {
    Navigator.of(this).replace(oldRoute: oldRoute, newRoute: newRoute);
  }

  // Get current route name (if available)
  String? get currentRouteName {
    String? routeName;
    Navigator.of(this).popUntil((route) {
      routeName = route.settings.name;
      return true;
    });
    return routeName;
  }
}