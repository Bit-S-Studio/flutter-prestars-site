import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class CharacteristicsField extends StatefulWidget {
  const CharacteristicsField({Key? key}) : super(key: key);

  @override
  State<CharacteristicsField> createState() => _CharacteristicsFieldState();
}

class _CharacteristicsFieldState extends State<CharacteristicsField> {
  final controller = GetIt.I.get<FieldCharacteristicsController>();
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final athleteForm = controller.athleteController.athleteForm;
    return ReactiveFormConsumer(builder: (context, form, child) {
      return ReactiveFormBuilder(
          form: () => athleteForm.formGroup,
          builder: (context, form, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ReactiveMultiSelect(
                  formGroup: athleteForm.formGroup,
                  formControlName: ConstantsForms.characteristics,
                  searchedTagsFormControlName:
                      ConstantsForms.characteristicsSearched,
                  searchTagsFormControlName:
                      ConstantsForms.characteristicsSearch,
                  isMandatory: true,
                  labelText: ConstantsLabels.characteristicsTextField,
                  hint: ConstantsLabels.selectOptions,
                  validationMessages: athleteForm.validationMessages,
                  tagList: athleteForm.characteristicsSearched,
                  setValue: (value) => athleteForm.setPosition = value,
                  searchFunction: (search) =>
                      controller.getCharacteristics(search)),
            );
          });
    });
  }
}
