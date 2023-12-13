import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class AlertCard extends StatelessWidget {
  final String text;
  final double? maxFontSize;
  const AlertCard({super.key, required this.text, this.maxFontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ThemeService.colors.textTerciary,
          borderRadius: BorderRadius.circular(16)),
      child: AutoSizeText(text,
          maxFontSize: maxFontSize ?? 16,
          minFontSize: 12,
          // maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: ThemeService.styles.exo2Body(
              size: 16,
              color: ThemeService.colors.textReliable,
              fontWeight: FontWeight.w400)),
    );
  }
}
