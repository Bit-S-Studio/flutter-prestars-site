import '../../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiLinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  const UiLinkButton(this.text,
      {required this.onPressed, Key? key, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: textStyle ??
            ThemeService.styles.montserratOverline(
                hasUnderline: true, color: ThemeService.colors.textTerciary),
      ),
    );
  }
}
