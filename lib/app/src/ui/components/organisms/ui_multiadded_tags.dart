import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UiMultiAddedTags extends StatelessWidget {
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
  final String addedTagsFormControlName;
  final bool isMandatory;
  final Function(String) setValue;

  const UiMultiAddedTags(
      {Key? key,
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
      required this.addedTagsFormControlName,
      required this.setValue,
      this.isMandatory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AutoSizeText.rich(
            TextSpan(
                text: labelText,
                style: ThemeService.styles
                    .exo2Caption(color: _getColorWithValid()),
                children: [
                  if (isMandatory)
                    TextSpan(text: ' (*)', style: ThemeService.styles.danger())
                ]),
          ),
        ),
        UiField(
            labelText: '',
            formControlName: formControlName ?? '',
            type: TextfieldType.text,
            onSubmitted: (form) => onPressedExpanded(form.value as String),
            suffix: InkWell(
              onTap: () => onPressedExpanded(
                  formGroup.control(formControlName ?? '').value as String),
              child: Icon(Icons.add_circle_outline,
                  color: ThemeService.colors.primary),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: UiTags(
              selectedList: tagListSelected,
              isEnabled: isEnabled,
              onDeleteExpanded: onDeleteExpanded),
        ),
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
