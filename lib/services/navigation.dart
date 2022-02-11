import 'package:flutter/material.dart';
import 'package:newspaper/core/constants/route_name.dart';
import 'package:newspaper/features/news/data/models/_models.dart';
import 'package:newspaper/features/news/presentation/pages/_pages.dart';

abstract class Navigation {
  Future<T?> navigateTo<T>(Widget newPage, [String routeName]);
  Future<T?>? pushRoute<T>(ModalRoute<T> route, [String routeName]);
  void pop<T>([T result]);
  void popUntil(String routeName);
  void updateHistory(String routeName);
  bool canPop();
}

class NavigationService implements Navigation {
  final _history = <String>[];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void updateHistory(String? routeName) {
    if (routeName != null) {
      _history.add(routeName);
    }
  }

  Future<T?> push<T>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  Future<T?> pushReplacement<T, K>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.pushReplacement<T, K>(
      MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  @override
  Future<T?>? pushRoute<T>(Route<T> route, [String? routeName]) {
    updateHistory(routeName);
    return navigatorKey.currentState?.push<T>(route);
  }

  @override
  void pop<T>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  @override
  Future<T?> navigateTo<T>(Widget newPage, [String? routeName]) {
    return push<T>(newPage, routeName);
  }

  @override
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  @override
  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  Future<void> goToArticleDetail(ArticleModel article) async {
    return push(
      ArticleDetailPage(
        article: article,
      ),
      RouteName.articleDetailPage,
    );
  }
}
