import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiEmphasisText extends StatelessWidget {
  final String textStart;
  final String textEmphasis;
  final String textFinish;
  final TextAlign? textAlign;
  const UiEmphasisText(
      {super.key,
      required this.textStart,
      required this.textEmphasis,
      required this.textFinish,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(text: textStart, children: [
        TextSpan(text: textEmphasis, style: ThemeService.styles.exo2Emphasis()),
        TextSpan(text: textFinish),
      ]),
      maxFontSize: 48,
      minFontSize: 20,
      style: ThemeService.styles.exo2Title(),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
