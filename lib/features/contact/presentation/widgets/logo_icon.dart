part of '../pages/contact_page.dart';

final class _LogoIcon extends StatelessWidget {
  const _LogoIcon({required this.asset, this.link});

  final String asset;
  final String? link;

  @override
  Widget build(BuildContext context) {
    const iconSize = 60.0;

    final iconWidget = SizedBox.square(
      dimension: iconSize,
      child: SvgPicture.asset(asset, fit: BoxFit.cover),
    );

    return link != null
        ? GestureDetector(
            onTap: () => _goToURL(link!),
            child: MouseRegion(cursor: SystemMouseCursors.click, child: iconWidget),
          )
        : iconWidget;
  }

  Future<void> _goToURL(String link) async {
    final uri = Uri.parse(link);

    try {
      await launchUrl(uri);
    } catch (error) {
      print('Error lunching on IconLink: $link');
    }
  }
}
