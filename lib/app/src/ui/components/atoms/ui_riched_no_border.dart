import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UIRichedNoBorder extends StatelessWidget {
  const UIRichedNoBorder({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.maxLines,
    this.maxLenght,
    this.height,
    this.prefixIcon,
    this.suffix,
    this.obscureText,
    this.controller,
    this.formControlName,
    this.passwordsMatch,
    this.autovalidateMode,
    this.validationMessages,
    required this.type,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? maxLenght;
  final double? height;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? formControlName;
  final bool? passwordsMatch;
  final AutovalidateMode? autovalidateMode;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final TextfieldType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: height ?? 49,
      child: ReactiveTextField(
        formControlName: formControlName,
        // validationMessages: ValidationMessages().call,
        controller: controller,
        style: ThemeService.styles.exo2Body(
          color: ThemeService.colors.terciary,
        ),
        obscureText: obscureText ?? false,
        cursorColor: ThemeService.colors.textTerciary,
        maxLines: maxLines,
        maxLength: maxLenght,
        cursorWidth: 0,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: ThemeService.colors.secondary,
                )
              : null,
          suffixIcon: suffix,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.white,
              width: 0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.danger,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.terciary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.danger,
              width: 0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeService.colors.terciary,
              width: 0,
            ),
          ),
          labelText: labelText,
          hintText: hintText,
          labelStyle:
              ThemeService.styles.exo2Body(color: ThemeService.colors.terciary),
          floatingLabelStyle: ThemeService.styles.exo2Body(
            color: ThemeService.colors.secondary,
          ),
        ),
        textInputAction: GetTextInputAction.call(type),
        inputFormatters: GetTextInputFormatters.call(type),
        keyboardType: GetTextInputType.call(type),
      ),
    );
  }
}
