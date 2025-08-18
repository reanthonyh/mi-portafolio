import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/features/work/providers/works_provider.dart';

part '../widgets/work_card.dart';

final class AboutMePage extends ConsumerWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
                      // TODO: Complete the Show more of me
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
    );
  }
}
