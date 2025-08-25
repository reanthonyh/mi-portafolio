import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/assets.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/core/navigation/navigation_service.dart';

class CustomSideBar extends ConsumerWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.of(context);
    final textStyle = TextTheme.of(context);
    
    // Get current route from go_router
    final currentRoute = GoRouterState.of(context).fullPath;
    final navService = ref.read(navigationServiceProvider);
    
    // Try to get the StatefulNavigationShell if available
    final navigationShell = context.findAncestorWidgetOfExactType<StatefulNavigationShell>();

    final normalStyle = textStyle.titleLarge?.copyWith(
      color: colorScheme.onSecondaryContainer,
    );
    final selectedStyle = textStyle.titleLarge?.copyWith(
      color: colorScheme.surfaceContainerHighest,
    );

    return SizedBox.fromSize(
      size: normalNavBarSize,
      child: ColoredBox(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.85),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 5,
          children: [
            _NavItem(
              onTap: () {
                if (navigationShell != null) {
                  navigationShell.goBranch(0);
                } else {
                  navService.navigateToHome();
                }
              },
              child: SizedBox(
                width: 125,
                child: Image.asset(ImageAssets.logo, fit: BoxFit.cover),
              ),
            ),
            _NavItem(
              onTap: () {
                if (navigationShell != null) {
                  navigationShell.goBranch(1);
                } else {
                  navService.navigateToAboutMe();
                }
              },
              child: Text(
                'About Me',
                style: currentRoute?.startsWith('/aboutMe') == true ? selectedStyle : normalStyle,
              ),
            ),
            _NavItem(
              onTap: () {
                if (navigationShell != null) {
                  navigationShell.goBranch(2);
                } else {
                  navService.navigateToWorks();
                }
              },
              child: Text(
                'Works', 
                style: currentRoute == '/works' ? selectedStyle : normalStyle,
              ),
            ),
            _NavItem(
              onTap: () {
                if (navigationShell != null) {
                  navigationShell.goBranch(3);
                } else {
                  navService.navigateToContact();
                }
              },
              child: Text(
                'Contact', 
                style: currentRoute == '/contact' ? selectedStyle : normalStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
