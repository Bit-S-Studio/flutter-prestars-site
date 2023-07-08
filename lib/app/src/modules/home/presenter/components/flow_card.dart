import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prestarts_site/prestars_exports.dart';

class FlowCard extends StatelessWidget {
  final String image;
  final String title;
  final String step;
  const FlowCard(
      {super.key,
      required this.image,
      required this.title,
      required this.step});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 340,
          width: 340,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150, child: Image.asset(image)),
                  AutoSizeText(title,
                      style: ThemeService.styles.exo2miniTitle(),
                      textAlign: TextAlign.center),
                  // AutoSizeText(subTitle,
                  //     style: ThemeService.styles.exo2Body(size: 20)),
                  Icon(
                    Icons.keyboard_double_arrow_right_outlined,
                    color: ThemeService.colors.iconSecondary,
                  ),
                  AutoSizeText(step,
                      style: ThemeService.styles.exo2Body(),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
