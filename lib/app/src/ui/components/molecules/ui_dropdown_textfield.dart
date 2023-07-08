import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../prestars_exports.dart';

class UiDropdownTextField extends StatefulWidget {
  final FormGroup formGroup;
  final List<TagModel> tags;
  final Function(TagModel tag) onPressedExpanded;
  final String hint;
  final String selectedTagsFormControlName;
  final String searchedTagsFormControlName;
  final String searchTagsFormControlName;
  final Color iconColor;
  final Function(String) searchFunction;
  const UiDropdownTextField(
      {Key? key,
      required this.formGroup,
      required this.tags,
      required this.onPressedExpanded,
      required this.hint,
      required this.selectedTagsFormControlName,
      required this.searchedTagsFormControlName,
      required this.searchTagsFormControlName,
      required this.iconColor,
      required this.searchFunction})
      : super(key: key);

  @override
  State<UiDropdownTextField> createState() => _UiDropdownTextFieldState();
}

class _UiDropdownTextFieldState extends State<UiDropdownTextField> {
  late OpenDropDownController controller;

  @override
  void initState() {
    controller = OpenDropDownController(false);
    controller.focusNode = FocusNode();
    DropDownGetTags.call(
        tags: widget.tags,
        form: widget.formGroup,
        selectedTagsFormControlName: widget.selectedTagsFormControlName,
        searchedTagsFormControlName: widget.searchedTagsFormControlName,
        searchTagsFormControlName: widget.searchTagsFormControlName,
        searchFunction: widget.searchFunction);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    controller.focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompositedTransformTarget(
            link: controller.layerLink,
            child: Focus(
              onFocusChange: (value) => controller.toggleDropdown(
                  context, value,
                  formGroup: widget.formGroup,
                  tags: widget.tags,
                  onPressedExpanded: widget.onPressedExpanded,
                  searchTagsFormControlName: widget.searchTagsFormControlName,
                  selectedTagsFormControlName:
                      widget.selectedTagsFormControlName,
                  searchedTagsFormControlName:
                      widget.searchedTagsFormControlName),
              child: ReactiveTextField(
                focusNode: controller.focusNode,
                autofocus: false,
                formControlName: widget.searchTagsFormControlName,
                style: ThemeService.styles.exo2Caption(),
                cursorColor: ThemeService.colors.iconPrimary,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: ThemeService.styles.exo2Caption(),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeService.colors.iconPrimary),
                      borderRadius: BorderRadius.circular(10)),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeService.colors.iconPrimary),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeService.colors.iconPrimary),
                      borderRadius: BorderRadius.circular(10)),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeService.colors.danger),
                      borderRadius: BorderRadius.circular(10)),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeService.colors.terciary),
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: RotatedBox(
                    quarterTurns: 1,
                    child: ValueListenableBuilder(
                        valueListenable: controller,
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return IconButton(
                            onPressed: value
                                ? () => controller.focusNode.unfocus()
                                : null,
                            icon: Icon(
                                value
                                    ? Icons.close
                                    : Icons.arrow_forward_ios_outlined,
                                color: widget.iconColor,
                                size: 24),
                          );
                        }),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
