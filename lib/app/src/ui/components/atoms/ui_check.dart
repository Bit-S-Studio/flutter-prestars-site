import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiCheck extends StatelessWidget {
  final String labelText;
  final String formControlName;
  final VoidCallback onTap;
  final Color? textColor;
  final double? textSize;
  final bool mini;
  final bool isMandatory;
  const UiCheck(
      {required this.labelText,
      required this.formControlName,
      required this.onTap,
      this.textColor,
      this.mini = false,
      this.textSize,
      this.isMandatory = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: ReactiveFormConsumer(builder: (context, form, child) {
              final bool isActive = form.control(formControlName).value;
              return Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: ThemeService.colors.border, width: 0.3),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.5,
                          // spreadRadius: 0.01,
                          offset: Offset(0.0, 2.5))
                    ]),
                child: Center(
                    child: InkWell(
                        onTap: onTap,
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: isActive
                              ? ThemeService.colors.primary
                              : Colors.white,
                        ))),
              );
            }),
          ),
          const SizedBox(width: 8),
          Flexible(
            flex: mini ? 4 : 10,
            child: AutoSizeText.rich(
              TextSpan(
                  text: labelText,
                  style: ThemeService.styles
                      .montserratCaption(color: textColor, size: textSize),
                  children: [
                    if (isMandatory)
                      TextSpan(
                          text: ' (*)', style: ThemeService.styles.danger())
                  ]),
              maxFontSize: textSize ?? 16,
              minFontSize: textSize ?? 12,
              // maxLines: 6,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
