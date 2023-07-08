import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiField extends StatelessWidget {
  const UiField({
    Key? key,
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
    this.maxLines,
    this.onSubmitted,
    this.onTap,
    this.padding,
    this.radius,
    this.enableLabel2 = false,
    this.backgroundColor,
    this.width,
    this.minLenght,
    this.minLenghtMessage,
    this.filled = false,
    this.isMandatory = false,
  }) : super(key: key);

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
  final double? width;
  final int? minLenght;
  final String? minLenghtMessage;
  final bool filled;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (enableLabel2)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 16.0),
            child: AutoSizeText.rich(
              TextSpan(
                  text: labelText ?? '',
                  style: ThemeService.styles.exo2Caption(
                      fontWeight: FontWeight.w500,
                      color: filled ? ThemeService.colors.white : null,
                      size: filled ? 12 : null),
                  children: [
                    if (isMandatory)
                      TextSpan(
                          text: ' (*)', style: ThemeService.styles.danger())
                  ]),
              maxLines: 1,
              maxFontSize: 16,
              minFontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (enableLabel2) const SizedBox(height: 8),
        SizedBox(
          width: width ?? double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 16.0),
            child: ReactiveTextField(
              maxLength: maxLenght,
              maxLines: maxLines ?? 1,
              minLines: 1,
              formControlName: formControlName,
              // onSubmitted: onSubmitted,
              validationMessages: ValidationMessages.value(
                  minLengthLabel: minLenghtMessage != null
                      ? (error) => (minLenghtMessage ?? '')
                      : null,
                  formControlName: labelText),
              controller: controller,
              style: ThemeService.styles.exo2Caption(),
              obscureText: obscureText ?? false,
              cursorColor: ThemeService.colors.textPrimary,
              cursorWidth: 1,
              decoration: InputDecoration(
                filled: filled,
                fillColor: backgroundColor ?? ThemeService.colors.white,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    vertical: filled ? 14 : 14.0, horizontal: filled ? 16 : 0),
                helperStyle: ThemeService.styles.exo2Caption(),
                errorStyle:
                    TextStyle(height: 1, color: ThemeService.colors.danger),
                prefixIcon: prefix,
                suffixIcon: suffix,
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemeService.colors.iconPrimary),
                    borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemeService.colors.iconPrimary),
                    borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemeService.colors.iconPrimary),
                    borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeService.colors.danger),
                    borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeService.colors.terciary),
                    borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                labelText: enableLabel2 ? null : labelText,
                hintText: hintText,
                labelStyle: ThemeService.styles.exo2Caption(),
                floatingLabelStyle: ThemeService.styles.exo2Caption(),
              ),
              textInputAction: GetTextInputAction.call(type),
              inputFormatters: GetTextInputFormatters.call(type),
              keyboardType: GetTextInputType.call(type),
              showErrors: (control) => control.invalid && control.touched,
            ),
          ),
        ),
      ],
    );
  }
}
