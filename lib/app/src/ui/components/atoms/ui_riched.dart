import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UIRiched extends StatelessWidget {
  const UIRiched({
    Key? key,
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
    return SizedBox(
      // margin: const EdgeInsets.all(16),
      height: height ?? 49,
      child: ReactiveTextField(
        formControlName: formControlName,
        // validationMessages: ValidationMessages().call,
        controller: controller,
        style: ThemeService.styles.exo2Body(
          color: ThemeService.colors.terciary,
        ),
        obscureText: obscureText ?? false,
        cursorColor: ThemeService.colors.textPrimary,
        maxLines: maxLines,
        maxLength: maxLenght,
        cursorWidth: 1,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: ThemeService.colors.secondary,
                )
              : null,
          suffixIcon: suffix,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle:
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
