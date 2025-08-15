import 'package:flutter/material.dart';
import 'package:my_portfolio/core/router/main_router.dart';
import 'package:my_portfolio/features/root/presentation/providers/root_state.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_service.g.dart';

@riverpod
NavigationService navigationService(Ref ref) {
  return NavigationServiceImpl(ref);
}

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(Ref ref) {
  return GlobalKey<NavigatorState>();
}

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
  void navigateToAboutMe() => _navigate('/aboutMe', 1);

  @override
  void navigateToContact() => _navigate('/contact', 3);

  @override
  void navigateToHome() => _navigate('/', 0);

  @override
  void navigateToWork(String workId) => _navigate('/aboutMe/$workId', 1);

  @override
  void navigateToWorks() => _navigate('/works', 2);

  void _navigate(String path, int index) {
    print('to $path ($index)');
    final router = _ref.read(mainRouterProvider);
    router.go(path);
    _ref.read(rootStateProvider.notifier).changeIndex(index);
    print('Navigated to $path ($index)');
  }
}
