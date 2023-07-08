import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiSwitch extends StatelessWidget {
  final String labelText;
  final String formControlName;
  final String onLabel;
  final String offLabel;
  const UiSwitch(
      {required this.labelText,
      required this.formControlName,
      required this.onLabel,
      required this.offLabel,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:
              AutoSizeText(labelText, style: ThemeService.styles.exo2Caption()),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ReactiveSwitch(
              formControlName: formControlName,
              activeColor: ThemeService.colors.primary,
            ),
            ReactiveFormConsumer(builder: (context, form, child) {
              final bool isPCD = form.control(formControlName).value;
              return AutoSizeText(isPCD ? onLabel : offLabel,
                  style: ThemeService.styles.exo2Caption(size: 16));
            }),
          ],
        ),
      ],
    );
  }
}
