import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../prestars_exports.dart';

class UiSegmentedPartButton<T> extends StatelessWidget {
  final VoidCallback onPressed;
  final T value;
  final T selectedValue;
  final int positioned;
  final String label;
  const UiSegmentedPartButton(
      {super.key,
      required this.onPressed,
      required this.value,
      required this.selectedValue,
      required this.positioned,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () => onPressed(),
        child: Container(
          height: 40,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: value == selectedValue
                  ? ThemeService.colors.selectedItem
                  : ThemeService.colors.unselectedItem,
              borderRadius: BorderRadius.only(
                topLeft:
                    positioned == 1 ? const Radius.circular(16) : Radius.zero,
                bottomLeft:
                    positioned == 1 ? const Radius.circular(16) : Radius.zero,
                topRight:
                    positioned == 3 ? const Radius.circular(16) : Radius.zero,
                bottomRight:
                    positioned == 3 ? const Radius.circular(16) : Radius.zero,
              )),
          child: Center(
              child: AutoSizeText(
            label,
            style: ThemeService.styles.exo2Swith(),
            maxFontSize: 12,
            maxLines: 1,
            minFontSize: 8,
          )),
        ),
      ),
    );
  }
}
