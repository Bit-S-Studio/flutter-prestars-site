import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class BasicForms extends StatelessWidget {
  final AthleteController controller;
  const BasicForms({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: controller.athleteForm.formGroup,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AthleteImage(controller: controller),
            const SizedBox(height: 20),
            const UiField(
                labelText: ConstantsLabels.name,
                formControlName: ConstantsForms.name,
                isWhite: true,
                isMandatory: true,
                enableLabel2: true,
                type: TextfieldType.name),
            const SizedBox(height: 20),
            const UiField(
                labelText: ConstantsLabels.email,
                formControlName: ConstantsForms.email,
                isWhite: true,
                isMandatory: true,
                enableLabel2: true,
                type: TextfieldType.email),
            const SizedBox(height: 20),
            const UiField(
                labelText: ConstantsLabels.phone,
                formControlName: ConstantsForms.phone,
                isWhite: true,
                isMandatory: true,
                enableLabel2: true,
                type: TextfieldType.phone),
            const SizedBox(height: 20),
            const UiField(
                labelText: ConstantsLabels.birth,
                formControlName: ConstantsForms.birth,
                isWhite: true,
                isMandatory: true,
                enableLabel2: true,
                type: TextfieldType.date),
            const SizedBox(height: 20),
            const UiField(
                labelText: ConstantsLabels.state,
                formControlName: ConstantsForms.state,
                isWhite: true,
                isMandatory: true,
                enableLabel2: true,
                type: TextfieldType.text),
            const SizedBox(height: 20),
            const UiField(
                labelText: ConstantsLabels.city,
                formControlName: ConstantsForms.city,
                isWhite: true,
                isMandatory: true,
                enableLabel2: true,
                type: TextfieldType.text),
            const SizedBox(height: 20),
            const UiSelect(
                label: ConstantsLabels.gender,
                selectOne: 'Masculino',
                selectTwo: 'Feminino',
                isWhite: true,
                formControlName: ConstantsForms.gender),
          ],
        ));
  }
}
