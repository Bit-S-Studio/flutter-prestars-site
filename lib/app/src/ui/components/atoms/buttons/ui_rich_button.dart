import 'package:auto_size_text/auto_size_text.dart';
import '../../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiRichButton extends StatelessWidget {
  final String text;
  final String richText;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  const UiRichButton(
      {required this.text,
      required this.richText,
      required this.onPressed,
      Key? key,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: AutoSizeText.rich(TextSpan(
          text: text,
          style: ThemeService.styles
              .osvaldBody(color: ThemeService.colors.primary),
          children: [
            TextSpan(
              text: richText,
              style: ThemeService.styles.osvaldBody(),
            )
          ])),
    );
  }
}
