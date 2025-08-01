import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';

final class AboutMePage extends ConsumerStatefulWidget {
  const AboutMePage({super.key});

  @override
  ConsumerState<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends ConsumerState<AboutMePage> {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        // TODO: Complete
                      },
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

class _WorkCards extends StatefulWidget {
  const _WorkCards();

  @override
  State<_WorkCards> createState() => _WorkCardsState();
}

class _WorkCardsState extends State<_WorkCards> {
  late final _cardsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

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
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              surfaceTintColor: colorScheme.tertiaryContainer,
              child: Center(
                child: Text(
                  'Work $index',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onTertiaryContainer,
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
