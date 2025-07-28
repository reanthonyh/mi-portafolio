import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/feautres/home/presentation/pages/home_page.dart';
import 'package:my_portfolio/feautres/root/presentation/pages/root_page.dart';
import 'package:my_portfolio/feautres/root/presentation/providers/root_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_router.g.dart';

@riverpod
GoRouter mainRouter(Ref ref) {
  return GoRouter(
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        pageBuilder: RootPage.goPageBuilder,
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(
            path: '/aboutMe',
            builder: (context, state) => Column(
              spacing: 55,
              children: [
                Text('Go Back'),
                IconButton(
                  onPressed: () {
                    ref.watch(rootStateProvider.notifier).changeIndex(0);
                    context.go('/');
                  },
                  icon: const Icon(Icons.backup_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
