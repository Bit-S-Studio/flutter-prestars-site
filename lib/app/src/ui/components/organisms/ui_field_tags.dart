import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UiFieldTags extends ReactiveFormField<List<String>, List<String>> {
  UiFieldTags(
      {Key? key,
      required FormGroup formGroup,
      required String formControlName,
      required String labelText,
      String? hint,
      Map<String, String> Function(dynamic)? validationMessages,
      required String addedTagsFormControlName,
      required Function(String) setValue,
      bool isMandatory = false,
      bool? showErrors})
      : super(
            key: key,
            formControlName: addedTagsFormControlName,
            builder:
                (ReactiveFormFieldState<List<String>, List<String>> field) {
              return UiMultiAddedTags(
                formGroup: formGroup,
                formControlName: formControlName,
                addedTagsFormControlName: addedTagsFormControlName,
                isEnabled: field.control.enabled,
                isValid: (field.control.touched || field.control.dirty)
                    ? field.control.valid
                    : true,
                labelText: labelText,
                hint: hint,
                isMandatory: isMandatory,
                tagListSelected: field.value ?? [],
                validationMessages: validationMessages,
                showErrors: showErrors ?? true,
                onDeleteExpanded: (String tag) async {
                  final selectedTags = field.value ?? [];
                  final hasTag = selectedTags
                      // ignore: no_leading_underscores_for_local_identifiers
                      .where((_tag) => _tag == tag)
                      .toList();
                  if (hasTag.isNotEmpty) {
                    selectedTags
                        // ignore: no_leading_underscores_for_local_identifiers
                        .removeWhere((_tag) => _tag == tag);
                    field.didChange(selectedTags);
                    if (selectedTags.isEmpty) {
                      field.control
                          .setErrors({'O campo deve ter no minimo 1 item': 1});
                    }
                    formGroup
                        .control(formControlName)
                        .removeError(ConstantsValidators.URL);
                  }
                },
                onPressedExpanded: (String tag) async {
                  if (tag.isNotEmpty && tag.contains('.')) {
                    final selectedTags = field.value ?? [];
                    final hasTag = selectedTags
                        // ignore: no_leading_underscores_for_local_identifiers
                        .where((_tag) => _tag == tag)
                        .toList();
                    if (hasTag.isEmpty && selectedTags.length <= 2) {
                      field.didChange([...selectedTags, tag]);
                    }
                    formGroup.control(formControlName).value = '';
                    formGroup
                        .control(formControlName)
                        .removeError(ConstantsValidators.URL);
                  }
                },
                setValue: setValue,
              );
            });
}
