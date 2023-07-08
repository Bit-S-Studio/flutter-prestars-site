import '../../../../../prestars_exports.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class UiSelectDate {
  static Future<String> call(BuildContext context, DateTime currentDate) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              textTheme: TextTheme(
                  headlineSmall: ThemeService.styles
                      .exo2Body(color: ThemeService.colors.terciary),
                  titleLarge: ThemeService.styles
                      .exo2Body(color: ThemeService.colors.terciary)),
              colorScheme: ColorScheme.light(
                primary:
                    ThemeService.colors.secondary, // header background color
                onPrimary: ThemeService.colors.terciary, // header text color
                onSurface: ThemeService.colors.terciary, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                      ThemeService.colors.terciary, // button text color
                ),
              ),
            ),
            child: child ?? const SizedBox(),
          );
        }),
        context: context,
        initialDate: currentDate,
        locale: const Locale('pt', 'BR'),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate;
    }
    final brDate = UtilData.obterDataDDMMAAAA(currentDate);
    return brDate;
  }
}
