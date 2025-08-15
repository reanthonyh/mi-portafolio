part of '../page/work_page.dart';

class _WorkImagesPresentation extends StatefulWidget {
  const _WorkImagesPresentation({required this.imagesPath});

  final List<String> imagesPath;

  @override
  State<_WorkImagesPresentation> createState() => _WorkImagesPresentationState();
}

final class _WorkImagesPresentationState extends State<_WorkImagesPresentation> {
  late final carouselController = CarouselController();
  late List<SizedBox> images;

  static const _imagesWidth = 400.0;

  @override
  void initState() {
    images = widget.imagesPath
        .map(
          (source) => SizedBox(
            width: _imagesWidth,
            height: 200,
            child: Image.asset(source, fit: BoxFit.contain),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      onTap: null,
      enableSplash: false,
      controller: carouselController,
      itemExtent: _imagesWidth,
      padding: smallPadding,
      backgroundColor: ColorScheme.of(context).surface,
      children: images,
    );
  }

  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }
}
