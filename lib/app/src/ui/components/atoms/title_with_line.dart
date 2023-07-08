import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class TitleWithLine extends StatelessWidget {
  final String title;
  const TitleWithLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: ThemeService.styles.exo2LightTitle(),
            textAlign: TextAlign.left,
          ),
          Divider(color: ThemeService.colors.border)
        ],
      ),
    );
  }
}
