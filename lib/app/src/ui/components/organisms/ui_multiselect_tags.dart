import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UiMultiSelectTags extends StatelessWidget {
  final List<String> tagList;
  final String labelText;
  final Function(String tag) onDeleteExpanded;
  final Function(String tag) onPressedExpanded;
  final bool isValid;
  final String? hint;
  final List<String> tagListSelected;
  final bool isEnabled;
  final Map<String, String> Function(dynamic)? validationMessages;
  final String? formControlName;
  final bool showErrors;
  final FormGroup formGroup;
  final Key? keyOnPressedExpanded;
  final Key? keyOnDeleteExpanded;
  final String searchedTagsFormControlName;
  final String searchTagsFormControlName;
  final Future<List<String>> Function(String value) searchFunction;
  final bool isMandatory;
  final Function(String) setValue;

  const UiMultiSelectTags(
      {Key? key,
      required this.tagList,
      this.labelText = 'Label',
      required this.onPressedExpanded,
      required this.onDeleteExpanded,
      this.isValid = true,
      this.isEnabled = false,
      this.hint,
      this.tagListSelected = const [],
      this.validationMessages,
      this.formControlName,
      this.showErrors = true,
      this.keyOnPressedExpanded,
      this.keyOnDeleteExpanded,
      required this.formGroup,
      required this.searchedTagsFormControlName,
      required this.searchTagsFormControlName,
      required this.searchFunction,
      required this.setValue,
      this.isMandatory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
              text: labelText,
              style:
                  ThemeService.styles.exo2Caption(color: _getColorWithValid()),
              children: [
                if (isMandatory)
                  TextSpan(text: ' (*)', style: ThemeService.styles.danger())
              ]),
        ),
        UiDropdownField<String>(
          formControlName: searchTagsFormControlName,
          stringify: (value) {
            return value;
          },
          suggestionsCallback: (pattern) async {
            final completer = Completer<List<String>>();
            timer?.cancel();
            timer = Timer(const Duration(milliseconds: 500), () async {
              final tags = await searchFunction(pattern);
              completer.complete(tags);
            });
            return completer.future;
          },
          hintText: hint ?? '',
          suggestionWidget: (value) =>
              AutoSizeText(value, style: ThemeService.styles.exo2Caption()),
          labelText: labelText,
          type: TextfieldType.text,
          onSuggestionSelected: (value) => onPressedExpanded(value),
          viewDataTypeFromTextEditingValue: (value) {
            setValue(value);
            return value;
          },
        ),
        UiTags(
            selectedList: tagListSelected,
            isEnabled: isEnabled,
            onDeleteExpanded: onDeleteExpanded),
        if (formControlName != null)
          UiErrorList(
              hasFirstError: true,
              validationMessages: validationMessages,
              formControlName: formControlName ?? '')
      ],
    );
  }

  Color? _getColorWithValid() {
    return !isValid && isEnabled && showErrors
        ? ThemeService.colors.danger
        : ThemeService.colors.iconPrimary;
  }
}
