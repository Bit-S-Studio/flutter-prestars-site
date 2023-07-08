import 'package:auto_size_text/auto_size_text.dart';

import '../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UiDropDownFilled<T> extends StatelessWidget {
  final String formControlName;
  final List<DropdownMenuItem<T>> items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Function(FormControl<T>)? onChanged;
  final bool enableLabel2;
  final String? labelText;
  final double? padding;
  final bool filled;
  final Color? labelColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool isOutlined;
  final bool removeTopSized;
  const UiDropDownFilled(
      {Key? key,
      required this.formControlName,
      required this.items,
      this.selectedItemBuilder,
      this.onChanged,
      this.enableLabel2 = true,
      this.labelText,
      this.padding,
      this.filled = false,
      this.labelColor,
      this.isOutlined = false,
      this.borderColor,
      this.borderWidth,
      this.removeTopSized = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!removeTopSized) const SizedBox(height: 13),
        if (enableLabel2)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 16.0),
            child: AutoSizeText(labelText ?? '',
                maxLines: 1,
                maxFontSize: 16,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                style: ThemeService.styles.exo2Caption(
                    color:
                        filled ? labelColor ?? ThemeService.colors.white : null,
                    size: filled ? 12 : null)),
          ),
        if (enableLabel2) const SizedBox(height: 8),
        Theme(
          data: ThemeData(canvasColor: ThemeService.colors.terciary),
          child: Container(
            height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ButtonTheme(
              padding: EdgeInsets.zero,
              child: ReactiveDropdownField<T>(
                formControlName: formControlName,
                items: items,
                onChanged: onChanged,
                dropdownColor: ThemeService.colors.terciary,
                isExpanded: true,
                itemHeight: 60,
                style: ThemeService.styles.exo2Caption(),
                // textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: filled,
                  fillColor: ThemeService.colors.white,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: filled ? 16 : 0),
                  helperStyle: ThemeService.styles.exo2Caption(),
                  errorStyle: const TextStyle(height: 1),
                  focusedBorder: isOutlined
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor ?? ThemeService.colors.secondary,
                            width: borderWidth ?? 0,
                          ),
                          borderRadius: BorderRadius.circular(filled ? 10 : 0))
                      : UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                  focusedErrorBorder: isOutlined
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor ?? ThemeService.colors.secondary,
                            width: borderWidth ?? 0,
                          ),
                          borderRadius: BorderRadius.circular(filled ? 10 : 0))
                      : UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                  enabledBorder: isOutlined
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor ?? ThemeService.colors.secondary,
                            width: borderWidth ?? 0,
                          ),
                          borderRadius: BorderRadius.circular(filled ? 10 : 0))
                      : UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(filled ? 10 : 0)),
                  errorBorder: isOutlined
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor ?? ThemeService.colors.danger,
                            width: borderWidth ?? 0,
                          ),
                          borderRadius: BorderRadius.circular(filled ? 16 : 0))
                      : UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(filled ? 16 : 0)),
                  disabledBorder: isOutlined
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor ?? ThemeService.colors.secondary,
                            width: borderWidth ?? 0,
                          ),
                          borderRadius: BorderRadius.circular(filled ? 16 : 0))
                      : UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(filled ? 16 : 0)),
                  labelStyle: ThemeService.styles.exo2Caption(),
                  floatingLabelStyle: ThemeService.styles.exo2Caption(),
                ),

                selectedItemBuilder: selectedItemBuilder,
                icon: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.arrow_forward_ios_outlined,
                        color: ThemeService.colors.iconPrimary, size: 18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
