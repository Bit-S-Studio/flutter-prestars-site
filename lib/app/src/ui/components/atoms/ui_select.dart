import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UiSelect extends StatelessWidget {
  final String label;
  final String selectOne;
  final String selectTwo;
  final String formControlName;
  const UiSelect(
      {super.key,
      required this.label,
      required this.selectOne,
      required this.selectTwo,
      required this.formControlName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            TextSpan(
                text: label,
                style: ThemeService.styles.exo2Caption(
                    fontWeight: FontWeight.w500,
                    color: ThemeService.colors.textPrimary),
                children: [
                  TextSpan(text: ' (*)', style: ThemeService.styles.danger())
                ]),
            maxLines: 1,
            maxFontSize: 16,
            minFontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          ReactiveFormConsumer(builder: (context, formGroup, child) {
            final selectedOne =
                formGroup.control(formControlName).value as bool;
            return Row(
              children: [
                InkWell(
                  onTap: () => formGroup.control(formControlName).value = true,
                  child: Container(
                    decoration: BoxDecoration(
                        color: selectedOne
                            ? ThemeService.colors.primary
                            : ThemeService.colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: selectedOne
                                ? ThemeService.colors.white
                                : ThemeService.colors.primary)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectOne,
                          style: ThemeService.styles.exo2Caption(
                              color: selectedOne
                                  ? ThemeService.colors.white
                                  : ThemeService.colors.primary)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => formGroup.control(formControlName).value = false,
                  child: Container(
                    decoration: BoxDecoration(
                        color: selectedOne
                            ? ThemeService.colors.white
                            : ThemeService.colors.primary,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: selectedOne
                                ? ThemeService.colors.primary
                                : ThemeService.colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectTwo,
                          style: ThemeService.styles.exo2Caption(
                              color: selectedOne
                                  ? ThemeService.colors.primary
                                  : ThemeService.colors.white)),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
