import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/router/main_router.dart';
import 'package:my_portfolio/core/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, 'Orbitron', 'Electrolize');
    final theme = AnthonyTheme(textTheme);

    final router = ref.watch(mainRouterProvider);

    return MaterialApp.router(
      title: 'Mi portafolio',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router,
    );
  }
}
