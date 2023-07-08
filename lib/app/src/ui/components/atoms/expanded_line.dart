import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class ExpandedWithLine extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ExpandedWithLine({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: ThemeService.colors.terciary,
              ),
            ),
            const SizedBox(width: 16),
            AutoSizeText(
              title,
              style: ThemeService.styles
                  .exo2Body(color: ThemeService.colors.terciary),
              overflow: TextOverflow.clip,
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: ThemeService.colors.terciary,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
