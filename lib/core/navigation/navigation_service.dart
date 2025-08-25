import 'package:flutter/material.dart';
import 'package:my_portfolio/core/router/main_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_service.g.dart';

@riverpod
NavigationService navigationService(Ref ref) => NavigationServiceImpl(ref);

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(Ref ref) => GlobalKey<NavigatorState>();

abstract interface class NavigationService {
  void navigateToAboutMe();
  void navigateToContact();
  void navigateToHome();
  void navigateToWork(String workId);
  void navigateToWorks();
}

final class NavigationServiceImpl implements NavigationService {
  final Ref _ref;

  NavigationServiceImpl(this._ref);

  @override
  void navigateToAboutMe() {
    final router = _ref.read(mainRouterProvider);
    router.go('/aboutMe');
  }

  @override
  void navigateToContact() {
    final router = _ref.read(mainRouterProvider);
    router.go('/contact');
  }

  @override
  void navigateToHome() {
    final router = _ref.read(mainRouterProvider);
    router.go('/');
  }

  @override
  void navigateToWork(String workId) {
    final router = _ref.read(mainRouterProvider);
    router.go('/aboutMe/$workId');
  }

  @override
  void navigateToWorks() {
    final router = _ref.read(mainRouterProvider);
    router.go('/works');
  }
}
