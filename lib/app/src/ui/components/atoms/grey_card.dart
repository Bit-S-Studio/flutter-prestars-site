import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class GreyCard extends StatelessWidget {
  final String text;
  final double? maxFontSize;
  const GreyCard({super.key, required this.text, this.maxFontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      padding: const EdgeInsets.fromLTRB(42, 22, 42, 22),
      decoration: BoxDecoration(
          color: ThemeService.colors.textTerciary,
          borderRadius: BorderRadius.circular(16)),
      child: AutoSizeText(text,
          maxFontSize: maxFontSize ?? 23,
          minFontSize: 12,
          // maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: ThemeService.styles.exo2Title(
              size: 23,
              color: ThemeService.colors.textWhite,
              fontWeight: FontWeight.w400)),
    );
  }
}
