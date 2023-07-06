import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiFieldComments extends StatelessWidget {
  const UiFieldComments(
      {Key? key,
      required this.labelText,
      this.prefix,
      this.suffix,
      this.hintText,
      this.obscureText,
      this.controller,
      required this.formControlName,
      this.passwordsMatch,
      this.autovalidateMode,
      this.validationMessages,
      this.padding,
      required this.type,
      this.helperText,
      this.maxLenght,
      this.maxLines,
      this.onSubmitted,
      this.onTap})
      : super(key: key);

  final String? labelText;
  final Widget? prefix;
  final String? hintText;
  final Widget? suffix;
  final bool? obscureText;
  final TextEditingController? controller;
  final String formControlName;
  final bool? passwordsMatch;
  final AutovalidateMode? autovalidateMode;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final TextfieldType type;
  final EdgeInsets? padding;
  final String? helperText;
  final VoidCallback? onSubmitted;
  final VoidCallback? onTap;
  final int? maxLenght;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      maxLength: maxLenght,
      maxLines: maxLines ?? 1,
      // onTap: onTap,
      formControlName: formControlName,
      // onSubmitted: onSubmitted,
      // validationMessages: ValidationMessages().call,
      controller: controller,
      style: ThemeService.styles
          .montserratBody(color: ThemeService.colors.terciary),
      obscureText: obscureText ?? false,
      cursorColor: ThemeService.colors.textPrimary,
      cursorWidth: 1,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        helperStyle: ThemeService.styles.montserratBody(),
        errorStyle: const TextStyle(height: 1),
        prefixIcon: prefix,
        suffixIcon: suffix,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeService.colors.secondary,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeService.colors.danger,
            width: 2,
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
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeService.colors.terciary,
            width: 2,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: ThemeService.styles
            .montserratBody(color: ThemeService.colors.terciary),
        floatingLabelStyle: ThemeService.styles.montserratBody(
          color: ThemeService.colors.secondary,
        ),
      ),
      textInputAction: GetTextInputAction.call(type),
      inputFormatters: GetTextInputFormatters.call(type),
      keyboardType: GetTextInputType.call(type),
      showErrors: (control) => control.invalid && control.touched,
    );
  }
}
