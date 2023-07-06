import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class UiDropdownField<T> extends StatelessWidget {
  const UiDropdownField(
      {Key? key,
      required this.stringify,
      required this.suggestionsCallback,
      required this.labelText,
      this.prefix,
      this.suffix,
      this.hintText,
      this.obscureText,
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
      this.keepSuggestionsOnLoading = true,
      this.onSuggestionSelected,
      this.filled = false,
      this.viewDataTypeFromTextEditingValue,
      this.suggestionWidget,
      this.isMandatory = false})
      : super(key: key);

  final String Function(T value) stringify;
  final SuggestionsCallback<T> suggestionsCallback;
  final String? labelText;
  final Widget? prefix;
  final String? hintText;
  final Widget? suffix;
  final bool? obscureText;
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
  final bool keepSuggestionsOnLoading;
  final Function(T value)? onSuggestionSelected;
  final bool filled;
  final bool isMandatory;
  final Widget Function(T value)? suggestionWidget;
  final T Function(String)? viewDataTypeFromTextEditingValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding ?? 16.0),
          child: AutoSizeText.rich(
            TextSpan(
                text: labelText ?? '',
                style: ThemeService.styles.montserratCaption(
                    fontWeight: FontWeight.w500,
                    color: filled ? ThemeService.colors.white : null,
                    size: filled ? 12 : null),
                children: [
                  if (isMandatory)
                    TextSpan(text: ' (*)', style: ThemeService.styles.danger())
                ]),
            maxLines: 1,
            maxFontSize: 16,
            minFontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 16.0),
            child: ReactiveDropdownSearch<T, T>(
              formControlName: formControlName,
              stringify: stringify,
              suggestionsCallback: suggestionsCallback,
              keepSuggestionsOnLoading: keepSuggestionsOnLoading,
              viewDataTypeFromTextEditingValue:
                  viewDataTypeFromTextEditingValue,
              onSuggestionSelected: onSuggestionSelected,
              itemBuilder: (context, suggestion) {
                if (suggestionWidget != null) {
                  return SizedBox(
                      height: 48,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: suggestionWidget!(suggestion),
                        ),
                      ));
                } else {
                  return const SizedBox();
                }
              },
              // onSubmitted: onSubmitted,
              validationMessages:
                  ValidationMessages.value(formControlName: labelText),
              textFieldConfiguration: TextFieldConfiguration(
                style: ThemeService.styles.montserratCaption(),
                // textAlignVertical: TextAlignVertical.center,
                cursorColor: ThemeService.colors.textPrimary,
                cursorWidth: 1,
                decoration: InputDecoration(
                    filled: filled,
                    fillColor: backgroundColor ?? ThemeService.colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: filled ? 16 : 0),
                    helperStyle: ThemeService.styles.montserratCaption(),
                    errorStyle:
                        TextStyle(height: 1, color: ThemeService.colors.danger),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                    errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                    disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                    labelStyle: ThemeService.styles.montserratCaption(),
                    floatingLabelStyle: ThemeService.styles.montserratCaption(),
                    suffixIcon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: ThemeService.colors.iconPrimary, size: 18))),
                textInputAction: GetTextInputAction.call(TextfieldType.text),
                keyboardType: GetTextInputType.call(TextfieldType.text),
              ),
              showErrors: (control) => control.invalid && control.touched,
            ),
          ),
        ),
      ],
    );
  }
}
