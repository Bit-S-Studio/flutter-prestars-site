import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiSimpleRichText extends StatelessWidget {
  final String prefix;
  final String text;
  const UiSimpleRichText({super.key, required this.prefix, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(TextSpan(
        text: '$prefix: ',
        style: ThemeService.styles.montserratBody(fontWeight: FontWeight.w700),
        children: [
          TextSpan(text: text, style: ThemeService.styles.montserratBody())
        ]));
  }
}
