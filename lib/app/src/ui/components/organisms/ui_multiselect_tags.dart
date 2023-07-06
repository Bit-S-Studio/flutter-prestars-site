import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class TagModel {
  String? id;
  String? label;
  dynamic value;

  TagModel({this.id, this.label, this.value});
}

class UiMultiSelectTags extends StatelessWidget {
  final List<TagModel> tagList;
  final String labelText;
  final Function(TagModel tag) onDeleteExpanded;
  final Function(TagModel tag) onPressedExpanded;
  final bool isValid;
  final String? hint;
  final List<TagModel> tagListSelected;
  final bool isEnabled;
  final Map<String, String> Function(dynamic)? validationMessages;
  final String? formControlName;
  final bool showErrors;
  final FormGroup formGroup;
  final Key? keyOnPressedExpanded;
  final Key? keyOnDeleteExpanded;
  final String searchedTagsFormControlName;
  final String searchTagsFormControlName;
  final Function(String) searchFunction;
  final bool isMandatory;

  const UiMultiSelectTags(
      {Key? key,
      required this.tagList,
      this.labelText = 'Label',
      required this.onPressedExpanded,
      required this.onDeleteExpanded,
      this.isValid = true,
      this.isEnabled = false,
      this.hint,
      this.tagListSelected = const <TagModel>[],
      this.validationMessages,
      this.formControlName,
      this.showErrors = true,
      this.keyOnPressedExpanded,
      this.keyOnDeleteExpanded,
      required this.formGroup,
      required this.searchedTagsFormControlName,
      required this.searchTagsFormControlName,
      required this.searchFunction,
      this.isMandatory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
              text: labelText,
              style: ThemeService.styles
                  .montserratCaption(color: _getColorWithValid()),
              children: [
                if (isMandatory)
                  TextSpan(text: ' (*)', style: ThemeService.styles.danger())
              ]),
        ),
        UiDropdownTextField(
            formGroup: formGroup,
            tags: formGroup.control('ConstantsForms.interestsSearched').value
                as List<TagModel>,
            onPressedExpanded: onPressedExpanded,
            hint: hint ?? '',
            selectedTagsFormControlName: formControlName ?? '',
            searchedTagsFormControlName: searchedTagsFormControlName,
            searchTagsFormControlName: searchTagsFormControlName,
            iconColor: _getColorWithValid() ?? ThemeService.colors.primary,
            searchFunction: searchFunction),
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
