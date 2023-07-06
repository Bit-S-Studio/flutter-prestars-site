import 'package:auto_size_text/auto_size_text.dart';

import '../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UiDropDown<T> extends StatelessWidget {
  final String formControlName;
  final List<DropdownMenuItem<T>> items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final Function(T? value)? onChanged;
  final bool enableLabel2;
  final String? labelText;
  final bool isMandatory;
  const UiDropDown(
      {Key? key,
      required this.formControlName,
      required this.items,
      this.selectedItemBuilder,
      this.onChanged,
      this.enableLabel2 = true,
      this.labelText,
      this.validationMessages,
      this.isMandatory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        if (enableLabel2)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: AutoSizeText.rich(
              TextSpan(
                  text: labelText ?? '',
                  style: ThemeService.styles.montserratCaption(),
                  children: [
                    if (isMandatory)
                      TextSpan(
                          text: ' (*)', style: ThemeService.styles.danger())
                  ]),
              maxLines: 1,
              maxFontSize: 16,
              minFontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (enableLabel2) const SizedBox(height: 4),
        Theme(
          data: ThemeData(canvasColor: ThemeService.colors.terciary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ButtonTheme(
              padding: EdgeInsets.zero,
              child: ReactiveDropdownField<T>(
                formControlName: formControlName,
                items: items,
                dropdownColor: ThemeService.colors.terciary,
                validationMessages:
                    ValidationMessages.value(formControlName: labelText),
                isExpanded: true,
                itemHeight: 60,
                style: ThemeService.styles.montserratCaption(size: 16),
                selectedItemBuilder: selectedItemBuilder,
                decoration: InputDecoration(
                  errorStyle:
                      TextStyle(height: 1, color: ThemeService.colors.danger),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                  hintText: ConstantsLabels.select,
                  enabledBorder: const UnderlineInputBorder(),
                ),
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.arrow_forward_ios_outlined,
                      color: ThemeService.colors.iconPrimary, size: 24),
                ),
                showErrors: (control) => control.invalid && control.touched,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
