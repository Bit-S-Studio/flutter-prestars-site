import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiName extends StatelessWidget {
  final double? size;
  const UiName({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(TextSpan(
        text: 'PRE',
        style: ThemeService.styles.exo2Title(size:size),
        children: [
          TextSpan(
              text: 'STARS',
              style: ThemeService.styles
                  .exo2Title(color: ThemeService.colors.primary))
        ]));
  }
}
