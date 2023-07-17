import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class DataForms extends StatelessWidget {
  final AthleteController controller;
  const DataForms({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ReactiveForm(
          formGroup: controller.athleteForm.formGroup,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UiSelect(
                  label: ConstantsLabels.favoriteLab,
                  selectOne: 'Direita',
                  selectTwo: 'Esquerda',
                  formControlName: ConstantsForms.favoriteLag),
              const SizedBox(height: 20),
              const UiField(
                  labelText: ConstantsLabels.height,
                  formControlName: ConstantsForms.height,
                  isMandatory: true,
                  enableLabel2: true,
                  type: TextfieldType.height),
              const SizedBox(height: 20),
              const UiField(
                  labelText: ConstantsLabels.heightOfFather,
                  formControlName: ConstantsForms.heightOfFather,
                  isMandatory: true,
                  enableLabel2: true,
                  type: TextfieldType.height),
              const SizedBox(height: 20),
              const UiField(
                  labelText: ConstantsLabels.weight,
                  formControlName: ConstantsForms.weight,
                  isMandatory: true,
                  enableLabel2: true,
                  type: TextfieldType.weight),
              const SizedBox(height: 20),
              const PositionsField(),
              const SizedBox(height: 20),
              const CharacteristicsField(),
              const SizedBox(height: 20),
              AthleteVideos(controller: controller),
              const SizedBox(height: 20),
              AthleteSubmitButton(controller: controller)
            ],
          )),
    );
  }
}
