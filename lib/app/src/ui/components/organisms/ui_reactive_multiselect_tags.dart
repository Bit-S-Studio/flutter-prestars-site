import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class ReactiveMultiSelect
    extends ReactiveFormField<List<TagModel>, List<TagModel>> {
  ReactiveMultiSelect(
      {Key? key,
      required FormGroup formGroup,
      required String formControlName,
      required String labelText,
      String? hint,
      required List<TagModel> tagList,
      Map<String, String> Function(dynamic)? validationMessages,
      required String searchedTagsFormControlName,
      required String searchTagsFormControlName,
      required Function(String) searchFunction,
      bool isMandatory = false,
      bool? showErrors})
      : super(
            key: key,
            formControlName: formControlName,
            builder:
                (ReactiveFormFieldState<List<TagModel>, List<TagModel>> field) {
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
                  onDeleteExpanded: (TagModel tag) {
                    final selectedTags = field.value ?? [];
                    final hasTag = selectedTags
                        // ignore: no_leading_underscores_for_local_identifiers
                        .where((_tag) => _tag.value == tag.value)
                        .toList();
                    if (hasTag.isNotEmpty) {
                      selectedTags
                          // ignore: no_leading_underscores_for_local_identifiers
                          .removeWhere((_tag) => _tag.value == tag.value);
                      field.didChange(selectedTags);
                      if (selectedTags.isEmpty) {
                        field.control.setErrors(
                            {'O campo deve ter no minimo 1 item': 1});
                      }
                      final searchedTags = formGroup
                          .control(searchedTagsFormControlName)
                          .value as List<TagModel>;
                      searchedTags.add(tag);
                      formGroup.control(searchedTagsFormControlName).value =
                          searchedTags;
                      searchFunction('');
                    }
                  },
                  onPressedExpanded: (TagModel tag) {
                    final selectedTags = field.value ?? [];
                    final hasTag = selectedTags
                        // ignore: no_leading_underscores_for_local_identifiers
                        .where((_tag) => _tag.value == tag.value)
                        .toList();
                    if (hasTag.isEmpty) {
                      field.didChange([...selectedTags, tag]);
                    }
                    searchFunction('');
                  });
            });
}
