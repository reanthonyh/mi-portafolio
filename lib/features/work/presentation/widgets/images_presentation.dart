part of '../page/work_page.dart';

class _WorkImagesPresentation extends StatefulWidget {
  const _WorkImagesPresentation({required this.imagesPath});

  final List<String> imagesPath;

  @override
  State<_WorkImagesPresentation> createState() => _WorkImagesPresentationState();
}

final class _WorkImagesPresentationState extends State<_WorkImagesPresentation>
    with WidgetsBindingObserver {
  late final carouselController = CarouselController();
  late List<SizedBox> images;
  Timer? _timer;
  int _currentIndex = 0;

  static const _imagesWidth = 400.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    images = widget.imagesPath
        .map(
          (source) => SizedBox(
            width: _imagesWidth,
            height: 200,
            child: Image.asset(source, fit: BoxFit.contain),
          ),
        )
        .toList();
    _startAutoSlide();
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

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentIndex = (_currentIndex + 1) % widget.imagesPath.length;
      carouselController.animateTo(
        _currentIndex.toDouble(),
        duration: Durations.medium1,
        curve: Curves.linear,
      );
    });
  }

  void _stopAutoSlide() => _timer?.cancel();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _stopAutoSlide();
    } else if (state == AppLifecycleState.resumed) {
      _startAutoSlide();
    }
  }

  @override
  void dispose() {
    _stopAutoSlide();
    WidgetsBinding.instance.removeObserver(this);
    carouselController.dispose();
    super.dispose();
  }
}
