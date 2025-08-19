import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/core/constants/assets.dart';
import 'package:my_portfolio/core/constants/dimensions.dart';

part '../widgets/logo_icon.dart';

final class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController name, subject, message;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    name = TextEditingController();
    subject = TextEditingController();
    message = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: largePadding,
      child: Column(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_upward_rounded),
            iconSize: 25,
            onPressed: () {},
          ),
          SizedBox.fromSize(
            size: Size(size.width * 0.6, size.height * 0.7),
            child: Column(
              spacing: 15,
              children: [
                Text("Contactame", style: textTheme.displayMedium),
                Text(
                  "Estoy interesado en mejorar profesionalmente asumiendo nuevos retos para poder solucionar distintos problemas de sistemas informaticos.",
                  style: textTheme.bodyLarge,
                ),
                const Divider(),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: name,
                          decoration: const InputDecoration(hintText: "Nombre"),
                          maxLines: 1,
                        ),
                        TextFormField(
                          controller: subject,
                          decoration: const InputDecoration(hintText: "Asunto"),
                          maxLines: 1,
                        ),
                        TextFormField(
                          controller: message,
                          decoration: const InputDecoration(hintText: "Mensaje"),
                          maxLines: 6,
                          maxLength: 500,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _LogoIcon(asset: SVGAssets.linkedin),
                    _LogoIcon(
                      asset: SVGAssets.github,
                      link: "https://github.com/reanthonyh",
                    ),
                    _LogoIcon(asset: SVGAssets.gitlab),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
