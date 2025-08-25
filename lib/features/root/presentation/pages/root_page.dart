import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/widgets/animated_background.dart';

import '../widgets/custom_side_bar.dart';

final class RootPage extends ConsumerWidget {
  const RootPage(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedShaderBackground(
            backgroundColor: colorScheme.primary,
            shapesColor: colorScheme.tertiary,
          ),
          Row(
            children: [
              const CustomSideBar(),
              Expanded(
                child: ColoredBox(
                  color: ColorScheme.of(context).surface.withAlpha(180),
                  child: navigationShell,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
