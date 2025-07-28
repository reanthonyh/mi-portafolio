import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/assets.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/feautres/root/presentation/providers/root_state.dart';

final class RootPage extends ConsumerWidget {
  const RootPage(this.child, {super.key});

  final Widget child;

  static Page goPageBuilder(BuildContext context, GoRouterState state, Widget child) {
    return MaterialPage(child: RootPage(child));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.of(context);

    final textStyle = TextTheme.of(context);
    final normalStyle = textStyle.titleLarge?.copyWith(
      color: colorScheme.onSecondaryContainer,
    );
    final selectedStyle = textStyle.titleLarge?.copyWith(color: Colors.red);

    final rootState = ref.watch(rootStateProvider);

    return Scaffold(
      body: Row(
        children: [
          SizedBox.fromSize(
            size: normalNavBarSize,
            child: ColoredBox(
              color: colorScheme.secondaryContainer,
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    child: Image.asset(ImageAssets.logo, fit: BoxFit.cover),
                  ),
                  Text('About Me', style: rootState != 1 ? normalStyle : selectedStyle),
                  Text('Works', style: rootState != 2 ? normalStyle : selectedStyle),
                  Text('Contact', style: rootState != 3 ? normalStyle : selectedStyle),
                ],
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
