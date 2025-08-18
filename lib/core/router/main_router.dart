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

@riverpod
GoRouter mainRouter(Ref ref) {
  return GoRouter(
    navigatorKey: ref.read(navigatorKeyProvider),
    routes: [
      ShellRoute(
        pageBuilder: RootPage.goPageBuilder,
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(
            path: '/aboutMe',
            builder: (context, state) => const AboutMePage(),
            routes: [
              GoRoute(
                path: '/:id',
                builder: (context, state) => WorkPage(workId: state.pathParameters['id']),
              ),
            ],
          ),
          GoRoute(path: '/works', builder: (context, state) => const WorkPage()),
          GoRoute(path: '/contact', builder: (context, state) => const ContactPage()),
        ],
      ),
    ],
  );
}
