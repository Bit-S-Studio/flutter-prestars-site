import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class ReactiveMultiSelect
    extends ReactiveFormField<List<String>, List<String>> {
  ReactiveMultiSelect(
      {Key? key,
      required FormGroup formGroup,
      required String formControlName,
      required String labelText,
      String? hint,
      required List<String> tagList,
      Map<String, String> Function(dynamic)? validationMessages,
      required String searchedTagsFormControlName,
      required String searchTagsFormControlName,
      required Future<List<String>> Function(String value) searchFunction,
      required Function(String) setValue,
      bool isMandatory = false,
      bool? showErrors})
      : super(
            key: key,
            formControlName: formControlName,
            builder:
                (ReactiveFormFieldState<List<String>, List<String>> field) {
              return UiMultiSelectTags(
                formGroup: formGroup,
                formControlName: formControlName,
                searchedTagsFormControlName: searchedTagsFormControlName,
                searchTagsFormControlName: searchTagsFormControlName,
                isEnabled: field.control.enabled,
                isValid: (field.control.touched || field.control.dirty)
                    ? field.control.valid
                    : true,
                labelText: labelText,
                tagList: tagList,
                hint: hint,
                isMandatory: isMandatory,
                tagListSelected: field.value!,
                validationMessages: validationMessages,
                showErrors: showErrors ?? true,
                searchFunction: searchFunction,
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
                    final searchedTags = formGroup
                        .control(searchedTagsFormControlName)
                        .value as List<String>;
                    searchedTags.add(tag);
                    formGroup.control(searchedTagsFormControlName).value =
                        searchedTags;
                  }
                },
                onPressedExpanded: (String tag) async {
                  final selectedTags = field.value ?? [];
                  final hasTag = selectedTags
                      // ignore: no_leading_underscores_for_local_identifiers
                      .where((_tag) => _tag == tag)
                      .toList();
                  if (hasTag.isEmpty && selectedTags.length <= 2) {
                    field.didChange([...selectedTags, tag]);
                  }
                  formGroup.control(searchTagsFormControlName).value = '';
                },
                setValue: setValue,
              );
            });
}
