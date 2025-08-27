import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/navigation/navigation_service.dart';
import 'package:my_portfolio/features/about_me/presentation/pages/about_me_page.dart';
import 'package:my_portfolio/features/contact/presentation/pages/contact_page.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_page.dart';
import 'package:my_portfolio/features/root/presentation/pages/root_page.dart';
import 'package:my_portfolio/features/work/presentation/page/work_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_router.g.dart';

class NoTransitionPage<T> extends Page<T> {
  const NoTransitionPage({
    required this.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    const lowDuration = Duration(milliseconds: 400);

    return PageRouteBuilder<T>(
      transitionDuration: lowDuration,
      reverseTransitionDuration: lowDuration,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}

@riverpod
GoRouter mainRouter(Ref ref) {
  return GoRouter(
    navigatorKey: ref.read(navigatorKeyProvider),
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => RootPage(navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),
          // About Me branch (index 1)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/aboutMe',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: AboutMePage()),
                routes: [
                  GoRoute(
                    path: '/:id',
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: WorkPage(workId: state.pathParameters['id']),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Works branch (index 2)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/works',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: WorkPage()),
              ),
            ],
          ),
          // Contact branch (index 3)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/contact',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ContactPage()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
