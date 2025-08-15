import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_portfolio/core/constants/assets.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';
import 'package:my_portfolio/core/navigation/navigation_service.dart';
import 'package:my_portfolio/features/work/providers/works_provider.dart';

part '../widgets/images_presentation.dart';

final _dateFormat = DateFormat('dd-MMMM-YYYY');

final class WorkPage extends ConsumerWidget {
  const WorkPage({super.key, this.workId});

  final String? workId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final works = ref.watch(worksProvider);
    final textTheme = Theme.of(context).textTheme;

    if (workId == null) {
      return Center(
        child: Text(
          "No se encontro el id del trabajo",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    }

    final work = works.firstWhereOrNull((element) => element.id == workId);

    if (work == null) {
      return Center(
        child: Text(
          "Trabajo no encontrado",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    }

    return Padding(
      padding: largePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              onPressed: () => ref.read(navigationServiceProvider).navigateToAboutMe(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              iconSize: 25,
              constraints: const BoxConstraints.expand(width: 60),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(work.title, style: textTheme.titleLarge),
                Text(work.companyName, style: textTheme.bodyLarge),
                Text(
                  '${work.startDate} - ${_dateFormat.format(work.endDate ?? DateTime.now())}',
                  style: textTheme.labelLarge,
                ),
                Text(work.description, style: textTheme.bodyMedium),
                const Flexible(
                  flex: 2,
                  child: _WorkImagesPresentation(
                    imagesPath: [
                      ImageAssets.logo,
                      ImageAssets.logo,
                      ImageAssets.logo,
                      ImageAssets.logo,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
