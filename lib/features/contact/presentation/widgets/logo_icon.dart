part of '../pages/contact_page.dart';

final class _LogoIcon extends StatelessWidget {
  const _LogoIcon({required this.asset, this.link});

  final String asset;
  final String? link;

  @override
  Widget build(BuildContext context) {
    const iconSize = 100.0;

    debugPrint("LogoButton => $link");

    return SizedBox.square(
      dimension: iconSize,
      child: SvgPicture.asset(asset, fit: BoxFit.cover),
    );
  }
}
