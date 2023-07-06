import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiFieldFilled extends StatelessWidget {
  const UiFieldFilled(
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
      required this.type,
      this.helperText,
      this.maxLenght,
      this.minLenght,
      this.maxLines,
      this.onSubmitted,
      this.onTap,
      this.padding,
      this.radius,
      this.enableLabel2 = false,
      this.backgroundColor,
      this.minLengthLabel,
      this.borderWidth,
      this.borderColor,
      this.labelColor,
      this.labelSize,
      this.filled = false})
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
  final double? padding;
  final String? helperText;
  final VoidCallback? onSubmitted;
  final VoidCallback? onTap;
  final int? maxLenght;
  final int? maxLines;
  final double? radius;
  final bool enableLabel2;
  final Color? backgroundColor;
  final int? minLenght;
  final String Function(Object)? minLengthLabel;
  final double? borderWidth;
  final double? labelSize;
  final Color? borderColor;
  final Color? labelColor;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (enableLabel2)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 16.0),
            child: AutoSizeText(labelText ?? '',
                maxLines: 1,
                maxFontSize: 16,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                style: ThemeService.styles.montserratCaption(
                    color:
                        filled ? labelColor ?? ThemeService.colors.white : null,
                    size: filled ? 12 : null)),
          ),
        if (enableLabel2) const SizedBox(height: 8),
        ReactiveTextField(
          maxLength: maxLenght,
          maxLines: maxLines ?? 1,
          minLines: 1,
          formControlName: formControlName,
          // onSubmitted: onSubmitted,
          validationMessages:
              ValidationMessages.value(minLengthLabel: minLengthLabel),
          controller: controller,
          style: ThemeService.styles
              .montserratCaption(color: ThemeService.colors.textTerciary),
          obscureText: obscureText ?? false,
          cursorColor: ThemeService.colors.textPrimary,
          cursorWidth: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: backgroundColor ?? ThemeService.colors.terciary,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: padding ?? 15.0, horizontal: padding ?? 16.0),
            helperStyle: ThemeService.styles
                .montserratCaption(color: ThemeService.colors.textTerciary),
            errorStyle: const TextStyle(height: 1),
            prefixIcon: prefix,
            suffixIcon: suffix,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ThemeService.colors.secondary,
                  width: borderWidth ?? 0,
                ),
                borderRadius: BorderRadius.circular(radius ?? 10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ThemeService.colors.danger,
                  width: borderWidth ?? 2,
                ),
                borderRadius: BorderRadius.circular(radius ?? 10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ThemeService.colors.terciary,
                  width: borderWidth ?? 2,
                ),
                borderRadius: BorderRadius.circular(radius ?? 10)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ThemeService.colors.danger,
                  width: borderWidth ?? 0,
                ),
                borderRadius: BorderRadius.circular(radius ?? 10)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ThemeService.colors.terciary,
                  width: borderWidth ?? 0,
                ),
                borderRadius: BorderRadius.circular(radius ?? 10)),
            labelText: enableLabel2 ? null : labelText,
            hintText: hintText,
            labelStyle: ThemeService.styles
                .montserratCaption(color: ThemeService.colors.textTerciary),
            floatingLabelStyle: ThemeService.styles
                .montserratCaption(color: ThemeService.colors.textTerciary),
          ),
          textInputAction: GetTextInputAction.call(type),
          inputFormatters: GetTextInputFormatters.call(type),
          keyboardType: GetTextInputType.call(type),
          showErrors: (control) => control.invalid && control.touched,
        ),
      ],
    );
  }
}
