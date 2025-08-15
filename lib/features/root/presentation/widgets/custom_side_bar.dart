import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/assets.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/core/navigation/navigation_service.dart';

import '../providers/root_state.dart';

class CustomSideBar extends ConsumerWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.of(context);
    final textStyle = TextTheme.of(context);

    final normalStyle = textStyle.titleLarge?.copyWith(
      color: colorScheme.onSecondaryContainer,
    );
    final selectedStyle = textStyle.titleLarge?.copyWith(color: colorScheme.primary);

    final rootState = ref.watch(rootStateProvider);

    return SizedBox.fromSize(
      size: normalNavBarSize,
      child: ColoredBox(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.85),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 5,
          children: [
            GestureDetector(
              onTap: () => ref.read(navigationServiceProvider).navigateToHome(),
              child: SizedBox(
                width: 125,
                child: Image.asset(ImageAssets.logo, fit: BoxFit.cover),
              ),
            ),
            GestureDetector(
              onTap: () => ref.read(navigationServiceProvider).navigateToAboutMe(),
              child: Text(
                'About Me',
                style: rootState != 1 ? normalStyle : selectedStyle,
              ),
            ),
            GestureDetector(
              onTap: () => ref.read(navigationServiceProvider).navigateToWorks(),
              child: Text('Works', style: rootState != 2 ? normalStyle : selectedStyle),
            ),
            GestureDetector(
              onTap: () => ref.read(navigationServiceProvider).navigateToContact(),
              child: Text('Contact', style: rootState != 3 ? normalStyle : selectedStyle),
            ),
          ],
        ),
      ),
    );
  }
}
