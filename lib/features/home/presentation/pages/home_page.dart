import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/core/navigation/navigation_service.dart';

final class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: largePadding,
            width: double.infinity,
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hola,", style: textTheme.displayLarge),
                Text(
                  "Soy Anthony Arnaldo Hernandez Flores,",
                  style: textTheme.displayLarge,
                ),
                Text("desarrollador mobil", style: textTheme.displayLarge),

                Text("Mobile Developer / Flutter Expert", style: textTheme.titleLarge),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 100),
          child: IconButton(
            onPressed: () => ref.read(navigationServiceProvider).navigateToAboutMe(),
            icon: const Icon(Icons.arrow_downward_rounded),
            iconSize: 25,
            constraints: const BoxConstraints.expand(height: 50),
          ),
        ),
      ],
    );
  }
}
