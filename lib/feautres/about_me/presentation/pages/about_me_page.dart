import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/feautres/work/providers/works_provider.dart';

final class AboutMePage extends ConsumerWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        spacing: 8,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: largePadding,
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("Sobre Mi"), Text("Sobre mi contenido")],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FilledButton.tonal(
                      onPressed: () {},
                      child: const Text("Ver mas ..."),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Flexible(flex: 4, child: _WorkCards()),
        ],
      ),
    );
  }
}

class _WorkCards extends ConsumerStatefulWidget {
  const _WorkCards();

  @override
  ConsumerState<_WorkCards> createState() => _WorkCardsState();
}

class _WorkCardsState extends ConsumerState<_WorkCards> {
  late final _cardsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final works = ref.watch(worksProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scrollbar(
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      controller: _cardsScrollController,
      child: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            _cardsScrollController.animateTo(
              _cardsScrollController.offset + pointerSignal.scrollDelta.dy * 4,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          }
        },
        child: GridView.builder(
          controller: _cardsScrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount: works.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _HoverCard(
              onTap: () => context.go('/aboutMe/${works.elementAt(index).id}'),
              child: Card(
                surfaceTintColor: colorScheme.tertiaryContainer,
                child: Center(
                  child: Text(
                    works[index].title,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HoverCard extends StatefulWidget {
  const _HoverCard({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}
