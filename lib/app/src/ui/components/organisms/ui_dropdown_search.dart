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
    return Focus(
      child: ReactiveDropdownSearch<T, T>(
        formControlName: formControlName,
        stringify: stringify,
        suggestionsCallback: suggestionsCallback,
        keepSuggestionsOnLoading: keepSuggestionsOnLoading,
        viewDataTypeFromTextEditingValue: viewDataTypeFromTextEditingValue,
        onSuggestionSelected: onSuggestionSelected,
        itemBuilder: (context, suggestion) {
          if (suggestionWidget != null) {
            return SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
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
          style: ThemeService.styles.exo2Caption(),
          // textAlignVertical: TextAlignVertical.center,
          cursorColor: ThemeService.colors.textPrimary,
          cursorWidth: 1,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: ThemeService.styles.exo2Caption(),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.white)),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.white)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.white)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.danger)),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.terciary)),
              suffixIcon: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.arrow_forward_ios_outlined,
                    color: ThemeService.colors.white, size: 24),
              )),
        ),
        showErrors: (control) => control.invalid && control.touched,
      ),
    );
  }
}
