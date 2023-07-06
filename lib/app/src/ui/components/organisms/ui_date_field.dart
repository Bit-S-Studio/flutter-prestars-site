import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiDateField extends StatelessWidget {
  final String formControlName;
  final Function(String value) onChanged;
  final String label;
  const UiDateField(
      {Key? key,
      required this.formControlName,
      required this.onChanged,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiField(
      formControlName: formControlName,
      onTap: () async {
        DateTime currentDate = DateTime.now();
        onChanged(await UiSelectDate.call(context, currentDate));
      },
      suffix: Icon(Icons.today, size: 18, color: ThemeService.colors.terciary),
      labelText: label,
      hintText: '01/01/2022',
      type: TextfieldType.date,
    );
  }
}
