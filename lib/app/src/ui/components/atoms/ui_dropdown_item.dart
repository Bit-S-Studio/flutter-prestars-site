import 'package:auto_size_text/auto_size_text.dart';
import '../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiDropDownItem<T> {
  DropdownMenuItem<T> call({required T? value, String? text}) =>
      DropdownMenuItem<T>(
        value: value,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              if (text != null)
                Flexible(
                  child: AutoSizeText(
                    text,
                    style: ThemeService.styles.exo2Caption(),
                    maxFontSize: 16,
                    maxLines: 1,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
            ],
          ),
        ),
      );
}
