import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiSearchField extends StatelessWidget {
  final String formControlName;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? widthBorder;
  final String? hint;
  const UiSearchField({
    Key? key,
    required this.formControlName,
    this.padding,
    this.borderRadius,
    this.hint,
    this.widthBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      style: ThemeService.styles.montserratBody(
        color: ThemeService.colors.terciary,
      ),
      cursorColor: ThemeService.colors.textPrimary,
      cursorWidth: 1,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        helperStyle: ThemeService.styles.montserratBody(),
        errorStyle: const TextStyle(height: 0),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12.0),
          child: SizedBox(),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.terciary,
              width: widthBorder ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 16)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.terciary,
              width: widthBorder ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 16)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.terciary,
              width: widthBorder ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 16)),
        hintText: hint ?? 'search',
        hintStyle: ThemeService.styles.montserratBody(
          color: ThemeService.colors.terciary,
        ),
      ),
      showErrors: (control) => false,
    );
  }
}
