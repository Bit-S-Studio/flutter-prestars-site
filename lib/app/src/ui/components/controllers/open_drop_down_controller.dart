import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class OpenDropDownController extends ValueNotifier<bool> {
  late OverlayEntry overlayEntry;
  late FocusNode focusNode;

  final layerLink = LayerLink();

  OpenDropDownController(super.value);

  void toggleDropdown(BuildContext context, bool hasFocus,
      {required FormGroup formGroup,
      required Function(String tag) onPressedExpanded,
      required List<String> tags,
      required String searchTagsFormControlName,
      required String selectedTagsFormControlName,
      required String searchedTagsFormControlName}) async {
    if (!hasFocus) {
      overlayEntry.remove();
      value = false;
    } else {
      DropDownInit.call(tags, formGroup, selectedTagsFormControlName,
          searchedTagsFormControlName);
      overlayEntry = UiDropdownOverlay.call(context,
          formGroup: formGroup,
          onPressedExpanded: onPressedExpanded,
          layerLink: layerLink,
          tags: tags,
          focusNode: focusNode,
          searchTagsFormControlName: searchTagsFormControlName,
          searchedTagsFormControlName: searchedTagsFormControlName);
      Overlay.of(context).insert(overlayEntry);
      value = true;
    }
  }
}
